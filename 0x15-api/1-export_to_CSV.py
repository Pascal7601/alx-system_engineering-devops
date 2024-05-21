#!/usr/bin/python3
"""
convert output to a csv file format
"""

import csv
import requests
import sys

if __name__ == '__main__':
    emp_id = int(sys.argv[1])

    url = f"https://jsonplaceholder.typicode.com/users/{emp_id}/todos"
    response = requests.get(url)
    res = response.json()
    done_todos = 0
    all_todos = len(res)
    for r in res:
        user_id = r.get('userId')

    emp_url = f"https://jsonplaceholder.typicode.com/users/{emp_id}"
    req = requests.get(emp_url)
    emp_json = req.json()
    employee_name = emp_json.get('username')

    with open(f"{user_id}.csv", "w") as filename:
        csv_writer = csv.writer(filename, quoting=csv.QUOTE_ALL)
        for r in res:
            status = r.get('completed')
            title = r.get('title')
            csv_writer.writerow([user_id, employee_name, status, title])
