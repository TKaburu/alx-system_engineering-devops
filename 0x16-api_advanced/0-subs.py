#!/usr/bin/python3

""" Get the number of subscribers """


import requests


def number_of_subscribers(subreddit):
    """
    This method returns the total number of subscribers
    of a given subredit
    """

    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    # Custom User-Agent header
    headers = {"User-Agent": "My user Agent 1.0"}
    response = requests.get(url, headers=headers, allow_redirects=False)

    # Checks if get was successful
    if response.status_code == 200:
        data = response.json().get("data", {})
        subscribers = data.get("subscribers", 0)
        return subscribers
    else:
        return 0
