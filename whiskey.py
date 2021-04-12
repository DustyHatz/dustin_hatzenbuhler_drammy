 #!/usr/bin/env python

import os
import sys
import json
import string
import requests
import csv

def main(args):

  url = f'https://flaviar.com/search/bottles'


  # extra header right now for preview featuressl
  request_headers = {'Cookie': '__cfduid=d7900bfd5f29e00b01842c7c91b3097e61616091696; sailthru_hid=afec58eeea1f3291c4228781324ed2cb60539bcef44c000cc555c9561ceaaa9b23e52428846ea20341df1433; flaviaruid=MzUwODM1NixhbGV4LmhhdHp6MTFAZ21haWwuY29tLDIwMjEtMDMtMThmTCpTNSM; flaviardft=odmv93j0u9p540moargjat9od4'}


  # get every two letter combo
  alpha = string.ascii_lowercase
  combos = [val1+val2+val3 for val1 in alpha for val2 in alpha for val3 in alpha]

  # main dictionary
  dictionary = {}

  for combo in combos:
    print(combo)
    data = {'q': combo}

    # get response for current combo
    response = requests.post(url, headers=request_headers, data=data)


    if(response.text != ''):

      for i, whiskey in enumerate(json.loads(response.text)):
        dictionary[whiskey['id']] = whiskey


  print('done!')
  # print(dictionary)

  filename = "whiskey.csv"

  # writing to csv file
  with open(filename, 'w') as f:
      for key in dictionary.keys():
        f.write("%s,%s\n"%(key,dictionary[key]))
  
if __name__ == '__main__':
  main(sys.argv)


