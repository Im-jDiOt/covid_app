import 'package:flutter/material.dart';
import 'package:covid_app/ui/widgets/Widgets.dart';

class MorePage1 extends StatefulWidget {
  @override
  _MorePage1State createState() => _MorePage1State();
}

class _MorePage1State extends State<MorePage1> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                          top: size.width * 0.1 + 20,
                          //left: size.width * 0.12,
                          //right: size.width * 0.12,
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                '<1>\n예방방법',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: size.width * 0.12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: size.width * 0.2 + 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                bottom: 30,
                              ),
                              child: Column(
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: '손을 자주 씻어주세요\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                        text(
                                            '- 물과 비누로 20초 이상 손씻기를 자주 하고 특히 공공 장소를 방문했거나 코를 풀고, 기침과 재채기를 한 후에는 꼭 씻어야 합니다.'),
                                        text(
                                            '- 물과 비누가 없는 경우 알코올이 60% 이상 함유된 손 소독제를 사용하세요. 손 표면 전체에 바르고 건조한 느낌이 들 때까지 양손을 비비세요.'),
                                        text('- 씻지 않은 손으로 눈, 코, 입을 만지지 마세요')
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '밀접 접촉을 피하세요\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text(
                                                '- 다른 사람과 최소 6피트(대략 팔 2배 거리)를 유지합니다.'),
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '다른 사람들 주위에 있을 때는 마스크로 입과 코를 가리세요\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text(
                                                '- 아픈 증상이 없더라도 COVID-19를 다른 사람에게 옮길 수 있습니다'),
                                            text(
                                                '- 마스크는 자신이 감염되었을 경우 다른 사람들을 보호하기 위한 것입니다.'),
                                            text(
                                                '- 공공장소에 나와 있을 때나, 같은 집에서 함께 생활하지 않는 사람들이 주위에 있을 때, 특히 다른 사회적 거리두기 조치의 유지가 어려울 때는 모든 사람이 마스크를 착용해야 합니다.'),
                                            text(
                                                '- 다른 사람들과 약 6피트 거리두기는 계속 실행하세요. 마스크는 사회적 거리두기를 대체할 수 없습니다'),
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '기침과 재채기는 가리고 하세요\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text(
                                                '- 기침이나 재채기를 할 때는 휴지나 팔꿈치 안쪽으로 항상 입과 코를 가려야하며, 침을 뱉지 말아야 합니다.'),
                                            text(
                                                '- 사용한 휴지는 쓰레기통에 버리세요.'),
                                          ])),
                                ],
                              ),
                            )
                          ],
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


