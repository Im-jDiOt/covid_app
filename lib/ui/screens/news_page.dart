import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_app/ui/widgets/Widgets.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String data = '';

  //String title = '';

  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('lib/assets/news.txt');

    setState(() {
      data = responseText;
    });
  }

  @override
  void initState() {
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> dataList = data.split('@@');

    return Scaffold(
      backgroundColor: Color(0xffd6d6d6),
      appBar: AppBar(
        backgroundColor: Color(0xff3D1472),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Head(size: size),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5,
                        left: size.width * 0.2,
                        right: size.width * 0.2),
                    child: NewsHead(
                      size: size,
                      dataList: dataList,
                      imgNum: 0,
                      titleNum: 10,
                      urlNum: 20,
                    ),
                  ),
                  // SizedBox(
                  //   height: 55,
                  // // ),
                  for (int i=1; i<10; i++)
                    NewsBlock(
                      size: size,
                      dataList: dataList,
                      imgNum: i,
                      titleNum: i+10,
                      urlNum: i+20,
                    )
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 1,
                  //   titleNum: 11,
                  //   urlNum: 21,
                  // ),
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 2,
                  //   titleNum: 12,
                  //   urlNum: 22,
                  // ),
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 3,
                  //   titleNum: 13,
                  // ),
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 4,
                  //   titleNum: 14,
                  // ),
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 5,
                  //   titleNum: 15,
                  // ),
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 6,
                  //   titleNum: 16,
                  // ),
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 7,
                  //   titleNum: 17,
                  // ),
                  // NewsBlock(
                  //   size: size,
                  //   dataList: dataList,
                  //   imgNum: 8,
                  //   titleNum: 18,
                  // ),
                  //  NewsBlock(
                  //    size: size,
                  //    dataList: dataList,
                  //    imgNum: 9,
                  //    titleNum: 19,
                  //  ),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}

class NewsHead extends StatefulWidget {
  final Size size;
  final List<String> dataList;
  final int imgNum;
  final int titleNum;
  final int urlNum;

  const NewsHead({this.size, this.dataList, this.imgNum, this.titleNum, this.urlNum});

  @override
  _NewsHeadState createState() => _NewsHeadState();
}

class _NewsHeadState extends State<NewsHead> {
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    List<String> dataList = widget.dataList;
    int imgNum = widget.imgNum;
    int titleNum = widget.titleNum;
    int urlNum = widget.urlNum;

    //height*0.3+100
    return Column(
      children: [
        Image.network(
          dataList[imgNum],
          width: size.width * 0.6,
          height: size.height * 0.25,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: size.height*0.05+100,
          child: RaisedButton(
              onPressed: () => setState(() {
                _launched = _launchURL(dataList[urlNum]);
              }),
              color: Colors.transparent,
              elevation: 0,
              child: Text(
                dataList[titleNum],
                style: TextStyle(fontSize: 20, color: Colors.white70),
              )),
        ),
      ],
    );
  }
}
// _launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }




class NewsBlock extends StatefulWidget {
  final Size size;
  final List<String> dataList;
  final int imgNum;
  final int titleNum;
  final int urlNum;

  const NewsBlock({this.size, this.dataList, this.imgNum, this.titleNum, this.urlNum});

  @override
  _NewsBlockState createState() => _NewsBlockState();
}

class _NewsBlockState extends State<NewsBlock> {
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    List<String> dataList = widget.dataList;
    int imgNum = widget.imgNum;
    int titleNum = widget.titleNum;
    int urlNum = widget.urlNum;

    return Stack(children: [
      Row(
        children: [
          Container(
              width: size.width * 0.35,
              height: size.width * 0.35,
              padding: EdgeInsets.all(7),
              color: Color(0xffd6d6d6),
              child: Image.network(
                dataList[imgNum],
                fit: BoxFit.cover,
              )),
          // Container(
          //   width: size.width-14,
          //   height: 1,
          //   color: Colors.black54,
          // ),
          Container(
            width: size.width * 0.65,
            height: size.width * 0.35,
            padding: EdgeInsets.all(7),
            color: Color(0xffd6d6d6),
            child: RaisedButton(
              onPressed: () => setState(() {
                _launched = _launchURL(dataList[urlNum]);
              }),
              color: Colors.transparent,
              elevation: 0,
              child: Text(
                dataList[titleNum],
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
          )
        ],
      ),
      Center(
        child: Container(
          width: size.width - 14,
          height: 1,
          color: Colors.black54,
        ),
      )
    ]);
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}