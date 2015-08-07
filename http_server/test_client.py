#!/usr/bin/env python
import sys
import urllib2
import urllib

from threading import Thread

def make_request(url):
#data = "https://www.tj-tool.com/media/images/2015/07/09/Texas_2012_10_10_1349908322000_4_2.jpg"
    data = "https://www.tj-tool.com/media/images/2015/07/09/California_2014_8_6_1407377760000_10_7.jpg"
    #data = "https://www.tj-tool.com/media/images/2015/06/01/California_2013_1_20_1358711989000_1_0.jpg"
    #data = "http://10.1.94.128:8000/~rgirdhar/memex/dataset/0001_Backpage/Images/ImagesTexas/Texas_2012_10_10_1349841918000_4_0.jpg"
#    data = "http://10.1.94.128:8000/~rgirdhar/memex/dataset/0001_Backpage/Images/ImagesCalifornia/California_2014_10_5_1412515911000_10_6.jpg"
#    data = "http://aws.tj-tool.com/media/images/2015/05/18/Minnesota_2014_10_14_1413313669000_10_4.jpg"
    headers = { 'Content-type' : 'text',  'Content-length' : str(len(data))}
    req = urllib2.Request(url, data, headers) #POST request
    try:
      response = urllib2.urlopen(req)
      result = response.read()
      print result
    except urllib2.URLError, err:
      print err

def main():
    port = 8888
    try:
      make_request("http://localhost:%d" % port)
    except urllib2.HTTPError, err:
      print err

main()
