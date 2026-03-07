# -*- codeing = utf-8 -*-
# @Time :2026/03/07 (Updated)
# @Author: Trae Agent
# @File : getAllAnnouns.py

import requests
import re
import datetime
import sys
import json

def get_Announs(stock_code, start_date=None, end_date=None):
    # 公告列表 URL (type=3 is for announcements)
    url = 'http://guba.eastmoney.com/list,{},3,f.html'.format(stock_code)
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
    }
    
    try:
        req = requests.get(url, headers=headers, timeout=10)
        req.raise_for_status()
        html = req.text
    except Exception as e:
        return []
        
    # 提取所有 JSON 变量
    results = []
    # 查找 listdata 或 other_list 中的 article_list
    json_matches = re.findall(r'var\s+[a-zA-Z0-9_]+\s*=\s*(\{.*?\});', html, re.DOTALL)
    
    # 准备日期范围
    if start_date and isinstance(start_date, str):
        try:
            start_dt = datetime.datetime.strptime(start_date, '%Y-%m-%d')
        except:
            start_dt = datetime.datetime.now() - datetime.timedelta(days=365)
    else:
        start_dt = start_date or (datetime.datetime.now() - datetime.timedelta(days=365))
        
    if end_date and isinstance(end_date, str):
        try:
            end_dt = datetime.datetime.strptime(end_date, '%Y-%m-%d')
        except:
            end_dt = datetime.datetime.now()
    else:
        end_dt = end_date or datetime.datetime.now()

    found_posts = []
    for json_str in json_matches:
        try:
            data = json.loads(json_str)
            # 兼容不同的数据结构
            articles = data.get('article_list', []) or data.get('re', [])
            if not isinstance(articles, list):
                continue
            found_posts.extend(articles)
        except:
            continue

    final_result = []
    seen_ids = set()
    for post in found_posts:
        post_id = post.get('post_id')
        if post_id in seen_ids:
            continue
        seen_ids.add(post_id)
        
        title = post.get('post_title', '')
        # 过滤掉非公告内容（公告通常由官方账号发布，或者在特定栏目）
        # 在 type=3 的页面，大部分都是公告
        
        last_time_str = post.get('post_last_time') or post.get('post_publish_time') or post.get('post_display_time')
        if not last_time_str:
            continue
            
        try:
            # 提取日期部分 "YYYY-MM-DD"
            date_match = re.search(r'\d{4}-\d{2}-\d{2}', last_time_str)
            if not date_match:
                continue
            date_str = date_match.group(0)
            post_dt = datetime.datetime.strptime(date_str, '%Y-%m-%d')
            
            if start_dt <= post_dt <= end_dt:
                final_result.append([stock_code, title, date_str])
        except:
            continue

    return final_result

if __name__ == '__main__':
    if len(sys.argv) > 1:
        stock_code = sys.argv[1]
        start_date = sys.argv[2] if len(sys.argv) > 2 else None
        end_date = sys.argv[3] if len(sys.argv) > 3 else None
        
        if '.' in stock_code:
            stock_code = stock_code.split('.')[0]
        stock_code = re.sub(r'^[a-zA-Z]+', '', stock_code)
            
        res = get_Announs(stock_code, start_date, end_date)
        print(json.dumps(res, ensure_ascii=False))
    else:
        print("Usage: python getAllAnnouns.py <stock_code> [start_date] [end_date]")
