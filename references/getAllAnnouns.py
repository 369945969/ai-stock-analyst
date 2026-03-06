# -*- codeing = utf-8 -*-
# @Time :2023/7/13 11:33
# @Author:王博君
# @File : test2.4.py
# @Software: PyCharm

from bs4 import BeautifulSoup
import requests
import re
import datetime
import time
import pandas as pd
import sys
import json

global_data = []  # 全局数据列表

def get_Announs(stock_code, start_date=None, end_date=None):
    base_url = 'http://guba.eastmoney.com/list,{},3,f{}.html'.format(stock_code, '{}')

    content_list = []  # 存储内容的列表

    for page in ['']:  # 爬取第一页
        url = base_url.format(page)
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36'}
        try:
            req = requests.get(url, headers=headers, timeout=10)
            req.raise_for_status()
        except Exception as e:
            return []
            
        soup = BeautifulSoup(req.text, 'html.parser')
        s1 = []
        s2 = []
        main_list = soup.find('div', id='mainlist')
        if not main_list:
            return []
            
        s2_original = main_list.find_all('div', class_='update')

        # 提取网页内时间数据
        for div in s2_original:
            date_text = div.text.strip()
            # 兼容更多日期
            match = re.search(r'\d{2}-\d{2}\s+\d{2}:\d{2}', date_text)
            if match:
                content = div.find_next('div', class_='update')
                if content:
                    content_list.append(content)

    # 筛选时间数据
    result = []
    for content in content_list:
        parent_content = content.parent
        siblings = parent_content.previous_siblings
        for sibling in siblings:
            if sibling.name == 'td':
                titles = sibling.find_all('div', class_='title')
                for title in titles:
                    if title.string is not None:
                        s1.append(title.string.strip())
                    if content.string is not None:
                        s2.append(content.string.strip())

    s12 = [[x, y] for x, y in zip(s1, s2)]

    current_year = datetime.datetime.now().year
    news = [row[0][:-7] if row[0].endswith(')') else row[0] for row in s12]
    dates = [f'{current_year}-{row[1][:5]}' for row in s12]

    # 使用函数参数中的日期范围
    if start_date and isinstance(start_date, str):
        try:
            start_dt = datetime.datetime.strptime(start_date, '%Y-%m-%d')
        except:
            start_dt = datetime.datetime.now().replace(day=1)
    else:
        start_dt = start_date or datetime.datetime.now().replace(day=1)
        
    if end_date and isinstance(end_date, str):
        try:
            end_dt = datetime.datetime.strptime(end_date, '%Y-%m-%d')
        except:
            end_dt = datetime.datetime.now()
    else:
        end_dt = end_date or datetime.datetime.now()
        
    result = [[stock_code, x, y] for x, y in zip(news, dates) if
              start_dt <= datetime.datetime.strptime(y, '%Y-%m-%d') <= end_dt]

    # 将结果追加到全局数据列表
    global_data.extend(result)

    return result

if __name__ == '__main__':
    if len(sys.argv) > 1:
        # CLI 模式: python getAllAnnouns.py <stock_code> [start_date] [end_date]
        stock_code = sys.argv[1]
        start_date = sys.argv[2] if len(sys.argv) > 2 else None
        end_date = sys.argv[3] if len(sys.argv) > 3 else None
        
        # 处理股票代码格式
        if '.' in stock_code:
            stock_code = stock_code.split('.')[0]
            
        res = get_Announs(stock_code, start_date, end_date)
        print(json.dumps(res, ensure_ascii=False))
    else:
        # 原有逻辑兼容
        start_date = datetime.datetime(2023, 7, 1)
        end_date = datetime.datetime(2023, 7, 13)
        print("正在读取股票excel文件...")
        try:
            df = pd.read_excel('stockInfo.xlsx')
            for stock_code in df['股票代码'][:-1]:
                stock_id = stock_code[:6]
                print(stock_code)
                result = get_Announs(stock_id, start_date, end_date)
                print(result)
                time.sleep(2)
            
            df_result = pd.DataFrame(global_data, columns=['股票代码', '新闻标题', '日期'])
            df_result.to_csv('Announ_result1ALL.csv', index=False, encoding='utf_8_sig')
        except FileNotFoundError:
            print("stockInfo.xlsx 不存在，请通过命令行参数调用。")
