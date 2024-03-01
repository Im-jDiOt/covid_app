import requests
from bs4 import BeautifulSoup

# 확진자수, 증가수, 검사수, 완치자수, 사망자수
numberF = open("D:/A_Coding/app/flutter/covid_app/lib/assets/number_data.txt", 'a')
numberReq = requests.get('http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=11&ncvContSeq=&contSeq=&board_id=&gubun=')
numberHtml = numberReq.text
numberSoup = BeautifulSoup(numberHtml, 'html.parser')

caValue = numberSoup.find_all('dd', class_='ca_value')
txtNtc = numberSoup.find_all('span', class_='txt_ntc')
date = numberSoup.select(".t_date")[0].get_text()[1:-8]

testingNumber = numberSoup.select("table.num.minisize>tbody>tr>td")[6].text
confirmedNumber = caValue[0].text
recoveredNumber = caValue[2].text
deadNumber = caValue[6].text

increasedConfirmed = numberSoup.select(".inner_value")[0].get_text()[2:]
increasedRecovered = txtNtc[0].get_text()[2:]
increasedDead = txtNtc[2].get_text()[2:]

numberF.write('{0}/{1}/{2}/{3}/{4}/{5}/{6}/{7}/\n'.format(date, testingNumber, confirmedNumber, recoveredNumber, deadNumber, increasedConfirmed, increasedRecovered, increasedDead))

numberF2 = open("D:/A_Coding/app/flutter/covid_app/lib/assets/number_data.txt", 'r')

dataList = numberF2.readlines()
numberList = []

for i in range(0, len(dataList)):
    numberList.append(dataList[i][:-1])

numberList.reverse()
print(numberList)
print(len(numberList))

numberF3 = open("D:/A_Coding/app/flutter/covid_app/lib/assets/number.txt", 'w')

for i in range(0, len(numberList)):
    numberF3.write(numberList[i])
# for i in range(0, len(numberList)):
#     numberF3.write(str(numberList[i])[:])
#     print(numberList[i][:-2])
#     #print(type(numberList[0]))


# 뉴스 이미지&제목&주소
newsF = open("D:/A_Coding/app/flutter/covid_app/lib/assets/news.txt", 'w', encoding='utf-8')
newsReq = requests.get('https://search.naver.com/search.naver?&where=news&query=%EC%BD%94%EB%A1%9C%EB%82%98&sm=tab_pge&sort=0&photo=0&field=0&reporter_article=&pd=0&ds=&de=&docid=&nso=so:r,p:all,a:all&mynews=0&cluster_rank=146&start=1&refresh_start=0')
newsHtml = newsReq.text
newsSoup = BeautifulSoup(newsHtml, 'html.parser',)

newsBxList = newsSoup.find_all('li', class_='bx', limit=10)

for i in range(0, len(newsBxList)):
    newsImage = newsBxList[i]
    newsImage_urlStart = str(newsImage).find('src') + 5
    newsImage_urlEnd = str(newsImage).find('"', newsImage_urlStart)
    newsImage_url = str(newsImage)[newsImage_urlStart : newsImage_urlEnd]
    newsF.write(newsImage_url+'@@')

for i in range(0, len(newsBxList)):
    newsTitle = newsBxList[i]
    newsTitle_titleStart = str(newsTitle).find('title')+7
    newsTitle_titleEnd = str(newsTitle).find('>', newsTitle_titleStart)-1
    newsTitle_title = str(newsTitle)[newsTitle_titleStart : newsTitle_titleEnd]
    newsF.write(newsTitle_title+'@@')
    print(newsTitle_title+'@@')

for i in range(0, len(newsBxList)):
    newsURL = newsBxList[i]
    newsURL_urlStart = str(newsURL).find('href')+6
    newsURL_urlEnd = str(newsURL).find('"', newsURL_urlStart)
    newsURL_url = str(newsURL)[newsURL_urlStart : newsURL_urlEnd]
    newsF.write(newsURL_url+'@@')
    




























