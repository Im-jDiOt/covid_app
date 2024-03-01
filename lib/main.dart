import 'package:flutter/material.dart';
import 'ui/screens/home_page.dart';
import 'ui/screens/analysis_page.dart';
import 'ui/screens/news_page.dart';
import 'ui/screens/more_page_1.dart';
import 'ui/screens/more_page_2.dart';
import 'ui/screens/more_page_3.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'covid-19',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/analysis': (context) => AnalysisPage(),
        '/news': (context) => NewsPage(),
        '/more_1': (context) => MorePage1(),
        '/more_2': (context) => MorePage2(),
        '/more_3': (context) => MorePage3(),
      },
      //home: HomePage(),
    );
  }
}


