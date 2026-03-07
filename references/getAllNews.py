# -*- codeing = utf-8 -*-
# @Time :2026/03/07 (Updated)
# @Author: Trae Agent
# @File : getAllNews.py

import requests
import re
import datetime
import sys
import json

global_data = []  # 全局数据列表

def get_news(stock_code, start_date=None, end_date=None):
    # 新闻列表 URL (type=1 is for news/posts)
    url = 'http://guba.eastmoney.com/list,{},1,f.html'.format(stock_code)
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
    }
    
    try:
        req = requests.get(url, headers=headers, timeout=10)
        req.raise_for_status()
        html = req.text
    except Exception as e:
        return []
        
    # 从 script 标签中提取 listdata
    match = re.search(r'var listdata\s*=\s*(\{.*?\});', html, re.DOTALL)
    if not match:
        return []
        
    try:
        data = json.loads(match.group(1))
        post_list = data.get('article_list', [])
    except Exception as e:
        return []

    # 准备日期范围
    if start_date and isinstance(start_date, str):
        try:
            start_dt = datetime.datetime.strptime(start_date, '%Y-%m-%d')
        except:
            start_dt = datetime.datetime.now() - datetime.timedelta(days=7)
    else:
        start_dt = start_date or (datetime.datetime.now() - datetime.timedelta(days=7))
        
    if end_date and isinstance(end_date, str):
        try:
            end_dt = datetime.datetime.strptime(end_date, '%Y-%m-%d')
        except:
            end_dt = datetime.datetime.now()
    else:
        end_dt = end_date or datetime.datetime.now()

    result = []
    for post in post_list:
        title = post.get('post_title', '')
        # 使用最后修改时间或发布时间
        last_time_str = post.get('post_last_time') or post.get('post_publish_time')
        if not last_time_str:
            continue
            
        try:
            # 格式可能是 "2026-03-05 19:52:28"
            post_dt = datetime.datetime.strptime(last_time_str[:10], '%Y-%m-%d')
            if start_dt <= post_dt <= end_dt:
                result.append([stock_code, title, last_time_str[:10]])
        except:
            continue

    global_data.extend(result)
    return result

if __name__ == '__main__':
    if len(sys.argv) > 1:
        # CLI 模式: python getAllNews.py <stock_code> [start_date] [end_date]
        stock_code = sys.argv[1]
        start_date = sys.argv[2] if len(sys.argv) > 2 else None
        end_date = sys.argv[3] if len(sys.argv) > 3 else None
        
        # 处理股票代码格式
        if '.' in stock_code:
            stock_code = stock_code.split('.')[0]
        # 兼容 sh600519 格式
        stock_code = re.sub(r'^[a-zA-Z]+', '', stock_code)
            
        res = get_news(stock_code, start_date, end_date)
        print(json.dumps(res, ensure_ascii=False))
    else:
        print("Usage: python getAllNews.py <stock_code> [start_date] [end_date]")
