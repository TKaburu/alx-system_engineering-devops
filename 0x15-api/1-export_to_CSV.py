#!/usr/bin/python3

"""Exports data in cvs format"""

from requests import get
from sys import argv


if __name__ == '__main__':
    user_id = argv[1]
    response = get(f'https://jsonplaceholder.typicode.com/users/{user_id}')
    username = response.json().get('username')

    response = get(f'https://jsonplaceholder.typicode.com/users/{user_id}/todos')
    tasks = response.json()
    with open(f'{user_id}.csv', 'w') as file:
        for task in tasks:
            file.write(f'"{user_id}","{username}","{task.get('completed')}","{task.get('title')}"\n')
