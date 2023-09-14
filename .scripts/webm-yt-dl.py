import sys
import requests
from bs4 import BeautifulSoup
import subprocess
import re

def download_webm(url):
    subprocess.call(['yt-dlp', url])

def process_url(url):
    response = requests.get(url)
    if response.status_code == 200:
        html_content = response.text
        soup = BeautifulSoup(html_content, 'html.parser')
        webm_links = soup.find_all('a', href=re.compile(r'\.webm$'))
        for link in webm_links:
            webm_url = link['href']
            download_webm(webm_url)

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python script.py <URL>")
        sys.exit(1)
    
    url = sys.argv[1]
    process_url(url)
