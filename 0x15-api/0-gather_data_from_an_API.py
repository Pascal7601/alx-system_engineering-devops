#!/usr/bin/python3
"""
script to fetch user details on an
api
"""
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
        if r.get('completed'):
            done_todos += 1

    emp_url = f"https://jsonplaceholder.typicode.com/users/{emp_id}"
    req = requests.get(emp_url)
    emp_json = req.json()
    employee_name = emp_json.get('name')
    print(f"Employee {employee_name} is done with tasks\
({done_todos}/{all_todos})")

    for r in res:
        if r.get('completed'):
            print(f"\t{r.get('title')}")
