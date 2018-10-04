#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct  1 15:32:30 2018

@author: wesleyz
"""

import csv

def SaveColecao(colecao,wordkey):
    with open(wordkey,encoding='utf-8', mode="w+") as file:
        writer = csv.writer(file, delimiter=";")
        for i in colecao:
            titulo = i[0]
            link = i[1]
            linha = (titulo,link)
            print(linha)
            writer.writerow(linha)            
    file.close()
    
    #os.system('sort  -t";" -k5 -k6 arquivosaida > arquivosaida.tmp')
    #os.system('mv arquivosaida.tmp arquivosaida')

import base64

words = ['brasil', 'brazil']


for query in words:    
    encoded = base64.b64encode(bytes(query,'utf-8'))
    #encoded = base64.b64encode(b'arquivo')
    strEncoded = str(encoded).replace('b', '').replace('\'', '')    
    import urllib.request, json 
    #with urllib.request.urlopen("http://200.137.66.6:8000/search/?action=search&database=atribuna&query=ZG9jdW1lbnRv") as url:
    with urllib.request.urlopen("http://200.137.66.6:8000/search/?action=search&database=atribuna&query="+strEncoded) as url:
        data = json.loads(url.read().decode())
        documentos = data['documents']
        
        SaveColecao(documentos,query)
    