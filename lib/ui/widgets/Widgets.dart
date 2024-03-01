import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


//Public Widgets

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Covid-19\nApp', style: TextStyle(color: Colors.white70, fontSize: 50),),
            decoration: BoxDecoration(
              color: Color(0xff3D1472),
            ),
          ),
          createDrawerItem(context: context, icon: Icons.home, title: 'Home', page: '/'),
          createDrawerItem(context: context, icon: Icons.edit, title: 'Analysis', page: '/analysis'),
          // ExpansionTile(
          //   title: Row(
          //     children: <Widget>[
          //       Icon(Icons.edit),
          //       Padding(
          //         padding: EdgeInsets.only(left: 8.0),
          //         child: Text('Analysis'),
          //       )
          //     ],
          //   ),
          //   children: <Widget>[
          //     createDrawerItem(context: context, title: 'SIR Model', page: '/analysis'),
          //     createDrawerItem(context: context, title: 'SIER Model'),
          //     createDrawerItem(context: context, title: 'Analysis'),
          //   ],
          // ),
          createDrawerItem(context: context, icon: Icons.dashboard, title: 'News', page: '/news'),
          //createDrawerItem(context: context, icon: Icons.more_horiz, title: 'More', page: '/more'),
          ExpansionTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.more_horiz),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('More'),
                )
              ],
            ),
            children: <Widget>[
              createDrawerItem(context: context, title: '예방 방법', page: '/more_1'),
              createDrawerItem(context: context, title: '증상', page: '/more_2'),
              createDrawerItem(context: context, title: '코로나 바이러스 특징', page: '/more_3'),
            ],
          ),
        ],
      ),
    );
  }
}

Widget createDrawerItem({BuildContext context, IconData icon, String title, String page}) {
  return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(title),
          )
        ],
      ),
      onTap: (){
        Navigator.pop(context);
        Navigator.pushNamed(context, page);
      }
  );
}



class Head extends StatelessWidget {
  Head({this.size});

  final Size size;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: size.height*0.3 + 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3D1472),
                Color(0xff771887),
              ]
          )
      ),
    );
  }
}


// HomePage Widgets

class First extends StatefulWidget {
  final Size size;
  final List<String> number;
  const First({this.size, this.number});

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {

  @override
  Widget build(BuildContext context) {

    Size size = widget.size;
    List<String> number = widget.number;

    return Column(
      children: <Widget>[
        SizedBox(height: 10+size.height*0.3,),
        // Container(
        //   height: size.height*0.3,
        //   color: Colors.white.withOpacity(0.2),
        // ),
        Center(
          child: RichText(
              text: TextSpan(
                  text: number[2],
                  style: TextStyle(color: Colors.white70, fontSize: 60,),
                  children: <TextSpan>[
                    TextSpan(
                        text: '(+'+number[5 ]+')',
                        style: TextStyle(color: Colors.white70, fontSize: 40,)
                    )
                  ]
              )
          ),
        )
      ],
    );
  }
}

class HeadChart extends StatefulWidget {
  final List<String> number;

  const HeadChart({this.number});

  @override
  _HeadChartState createState() => _HeadChartState();
}

class _HeadChartState extends State<HeadChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  //bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    List<String> number = widget.number;

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            child: Padding(
              padding:
              const EdgeInsets.only(right: 34, left: 0, top: 24, bottom: 0),
              child: LineChart(
                mainData(number),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(List<String> number) {
    return LineChartData(
      // lineTouchData: LineTouchData(
      //   touchTooltipData: LineTouchTooltipData(
      //     getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
      //       return touchedBarSpots.map((barSpot) {
      //         final flSpot = barSpot;
      //         if (flSpot.x == 0 || flSpot.x == 11){
      //           return null;
      //         }
      //
      //         return LineTooltipItem(
      //           '${number[flSpot.x.toInt()]}',
      //           const TextStyle(color: Colors.green)
      //         );
      //       });
      //     }
      //   )
      // ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return number[16];
              case 5:
                return number[8];
              case 9:
                return number[0];
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '200';
              case 3:
                return '270';
              case 5:
                return '340';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 3, color: Colors.white70, ),
              bottom: BorderSide(width: 3, color: Colors.white70))),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, (double.parse(number[21])-200)/35+1),
            FlSpot(5, (double.parse(number[13])-200)/35+1),
            FlSpot(9, (double.parse(number[5])-200)/35+1),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
      //showingTooltipIndicators: ShowingTooltipIndicators(int.parse((number[21])))
    );
  }
}

class Second extends StatefulWidget {
  final Size size;
  final List<String> number;

  const Second({this.size, this.number});

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    List<String> number = widget.number;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _classificationCircle(size, '검사 중', number[1], 145, 215, 179,),
            _classificationCircle(size, '확진자', number[2], 4, 81, 89,),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _classificationCircle(size, '완치자', number[3], 90, 80, 133,),
            _classificationCircle(size, '사망자', number[4], 114, 55, 139,),
          ],
        ),
      ],
    );
  }
}

Widget _classificationCircle(Size size, String type, String number, int r, int g, int b){

  double diameter = size.width*0.32;

  return Container(
    width: diameter,
    height: diameter,
    margin: EdgeInsets.only(right: 20),
    decoration:
    BoxDecoration(color: Color.fromARGB(255, r, g, b), shape: BoxShape.circle),
    child: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: diameter*0.4, left: diameter*0.1),
          height: 2,
          width: diameter * 0.8,
          color: Colors.white70,
        ),
        Text.rich(TextSpan(children: <InlineSpan>[
          WidgetSpan(
              child: SizedBox(
                width: diameter,
                height: diameter * 0.5,
                child: Center(
                    child: Text(
                      '$type',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: diameter * 0.5 * 0.3,
                          fontWeight: FontWeight.w900),
                    )),
              )),
          WidgetSpan(
              child: SizedBox(
                width: diameter,
                height: diameter * 0.5,
                child: Align(
                  alignment: FractionalOffset(0.5, 0.1),
                  child: Text(
                    '$number',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: diameter*0.5*0.4,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              )
          )
        ])),
      ],
    ),
  );
}

// more_page

TextStyle title() {
  return TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff1d1d1f));
}

TextSpan text(String text) {
  return TextSpan(
      text: text + '\n',
      style: TextStyle(
          fontSize: 16, color: Color(0xff333336), fontWeight: FontWeight.bold));
}



/*
class BottomChart extends StatefulWidget {
  final List<String> number;

  const BottomChart({this.number});

  @override
  _BottomChartState createState() => _BottomChartState();
}

class _BottomChartState extends State<BottomChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  Map<int, LineChartData> selection;
  int _selected = 0;
  bool showAvg = false;

  @override
  void initState() {
    selection = {0: cnfirmedData(widget.number), 1: recvredData(), 2: deadData()};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 3,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 0, left: 0, top: 36, bottom: 0),
                child: LineChart(
                  selection[_selected],
                ),
              ),
            ),
          ),
          SizedBox(
              width: 300,
              height: 34,
              child: Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          _selected = 0;
                        });
                      },
                      child: Text('Confirmed',
                          style: TextStyle(
                              fontSize: 12,
                              color: _selected == 0
                                  ? Colors.black
                                  : Colors.black.withOpacity(0.5)))),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          _selected = 1;
                        });
                      },
                      child: Text('Recovered',
                          style: TextStyle(
                              fontSize: 12,
                              color: _selected == 1
                                  ? Colors.black
                                  : Colors.black.withOpacity(0.5)))),
                  FlatButton(
                      onPressed: () {
                        print("dead");
                        setState(() {
                          _selected = 2;
                        });
                      },
                      child: Text('Dead',
                          style: TextStyle(
                              fontSize: 12,
                              color: _selected == 2
                                  ? Colors.black
                                  : Colors.black.withOpacity(0.5)))),
                ],
              ))
        ],
      ),
    );
  }

  LineChartData cnfirmedData(List<String> number) {
    //print(number[1]);
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return number[0];
            //return 'JAN';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(width: 3, color: Colors.black),
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 1),
            FlSpot(2.6, 2),
            FlSpot(4.9, 3),
            FlSpot(6.8, 4.1),
            FlSpot(8, 1),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData recvredData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(width: 3, color: Colors.black),
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }

  LineChartData deadData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            bottom: BorderSide(width: 3, color: Colors.black),
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
*/