#!/usr/bin/env python3

import csv
import json
import requests
import sys
import time
import ast
import argparse

def process_tags(tags_str):
    """Process tags string into a list of tags."""
    if not tags_str:
        return []
    try:
        tags = ast.literal_eval(tags_str)
        if isinstance(tags, list):
            return tags
        return []
    except:
        return []

def main():
    parser = argparse.ArgumentParser(description='Import Readwise Reader bookmarks to Cubox')
    parser.add_argument('api_token', help='Cubox API token')
    parser.add_argument('csv_file', help='Path to the CSV file')
    parser.add_argument('--debug', action='store_true', help='Print HTTP requests without sending them')
    args = parser.parse_args()

    api_url = f"https://cubox.pro/c/api/save/{args.api_token}"

    with open(args.csv_file, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            tags = process_tags(row['Document tags'])
            
            payload = {
                "type": "url",
                "content": row['URL'],
                "title": row['Title'],
                "description": "",
                "tags": tags,
                "folder": row['Location']
            }

            if args.debug:
                print(f"\nProcessing: {row['Title']}")
                print("\nHTTP Request:")
                print(f"URL: {api_url}")
                print("Headers:")
                print(json.dumps({"Content-Type": "application/json"}, indent=2))
                print("Payload:")
                print(json.dumps(payload, indent=2, ensure_ascii=False))
                print("\n[Debug mode] Request not sent")
                print("-" * 40)
            else:
                print(f"Importing: {row['Title']}")
                response = requests.post(
                    api_url,
                    json=payload,
                    headers={'Content-Type': 'application/json'}
                )
                print(f"Response: {response.text}")
                time.sleep(1)

if __name__ == "__main__":
    main()