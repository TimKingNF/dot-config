import sys
import requests
from lxml import etree
from urllib.parse import urlparse

word = sys.argv[1]
url = "https://www.ldoceonline.com/dictionary/{word}".format(word=word)

headers = {
    'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
}

resp = requests.get(url, headers=headers)
body = resp.content

html = etree.HTML(body)
audio_urls = html.xpath('//span[contains(@class, "amefile")]/@data-src-mp3')
if len(audio_urls) > 0:
    url_info = urlparse(audio_urls[0])
    print("{}://{}{}".format(url_info.scheme, url_info.netloc, url_info.path))