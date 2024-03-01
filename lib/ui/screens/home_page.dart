import 'package:covid_app/ui/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fl_chart/fl_chart.dart';
import 'package:covid_app/ui/widgets/Widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = '';

  fetchFileData() async {
    String responseText;
    responseText = await rootBundle.loadString('lib/assets/number.txt');

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
    List<String> number = data.split('/');

    return Scaffold(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        First(size: size, number: number),
                        //graph and confirmed number, top part
                        HeadChart(number: number)
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Second(size: size, number: number),
                    //testing, confirmed, recovered, dead number, middle part
                    SizedBox(
                      height: 50,
                    ),
                    // BottomChart(
                    //     //number: number,
                    //     )
                    RotatedBox(
                      quarterTurns: 1,
                        child: BottomChart(number: number))
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}


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

  //bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    List<String> number = widget.number;

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 3,
          child: Container(
            child: Padding(
              padding:
              const EdgeInsets.only(right: 48, left: 24, top: 24, bottom: 0),
              child: LineChart(
                cnfirmedData(number),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData cnfirmedData(List<String> number) {
    double days = (number.length~/8).toDouble();
    print(days);

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
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            return number[value.toInt()*8];
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false
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
      maxX: days-1,
      minY: 0,
      maxY: 6,
      // lineBarsData: [
      //   LineChartBarData(
      //     spots: [
      //       for (int i=0; i<8; i++)
      //         FlSpot(i.toDouble(), (double.parse(number[i*8+5])-50)/25+1),
      //     ],
      //     isCurved: true,
      //     colors: gradientColors,
      //     barWidth: 4,
      //     isStrokeCapRound: true,
      //     dotData: FlDotData(
      //       show: false,
      //     ),
      //     belowBarData: BarAreaData(
      //       show: false,
      //       colors:
      //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
      //     ),
      //   ),
      // ],
      //showingTooltipIndicators: ShowingTooltipIndicators(int.parse((number[21])))
    lineBarsData: linesBarData1(number, days),
    );
  }
  List<LineChartBarData> linesBarData1(List<String> number, double days) {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
            for (int i=0; i<days; i++)
            FlSpot(i.toDouble(), double.parse(number[i*8+5])/70+1),
      ],
      isCurved: true,
      colors: [
        //const Color(0xff045159),
        const Color(0xff377a8d),
      ],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        for (int i=0; i<days; i++)
          FlSpot(i.toDouble(), double.parse(number[i*8+6])/70+1)
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        for (int i=0; i<days; i++)
          FlSpot(i.toDouble(), double.parse(number[i*8+7])/50+1)
      ],
      isCurved: true,
      colors: const [
        Color(0x99aa4cfc),
      ],
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
}




