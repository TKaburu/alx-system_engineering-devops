#!/usr/bin/python3

""" Queries the Reddit API """

import requests


def top_ten(subreddit):
    """
    Query Reddit and print titles of the first 10 hot posts
    """

    url = f"https://www.reddit.com/r/{subreddit}/hot.json"

    # Set a custom User-Agent
    headers = {'User-Agent': 'My user Agent 1.0'}

    # send GET request
    response = requests.get(url, headers=headers, allow_redirects=False)

    try:
        response = requests.get(url, headers=headers,
                                allow_redirects=False)
        if response.status_code == 200:
            children = response.json().get('data').get('children')
            for i in range(10):
                print(children[i].get('data').get('title'))
        else:
            print("None")
    except Exception:
        print("None")
