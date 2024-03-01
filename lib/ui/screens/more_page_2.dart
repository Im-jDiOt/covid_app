import 'package:flutter/material.dart';
import 'package:covid_app/ui/widgets/Widgets.dart';

class MorePage2 extends StatefulWidget {
  @override
  _MorePage2State createState() => _MorePage2State();
}

class _MorePage2State extends State<MorePage2> {
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
                                '<2>\n증상',
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
                                          text: '주목할 증상\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text(
                                                'COVID-19에 감염된 사람은 가벼운 증상에서 중증 질환까지 다양한 범위의 증상을 겪는 것으로 보고되었습니다. 증상은 바이러스에 노출된 후 2-14일 뒤에 나타날 수 있습니다. 다음과 같은 증상이 나타나는 사람은 COVID-19에 감염되었을 가능성이 있습니다.\n'),
                                            text(
                                                '- 발열 또는 오한'),
                                            text('- 기침'),
                                            text('- 숨가쁨 또는 호흡곤란'),
                                            text('- 피로'),
                                            text('- 근육통 또는 몸살'),
                                            text('- 두통'),
                                            text('- 미각 또는 후각 상실'),
                                            text('- 인후염'),
                                            text('- 코막힘 또는 콧물'),
                                            text('- 메스꺼움 또는 구토'),
                                            text('- 설사'),
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '응급 경고 징후\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text(
                                                'COVID-19 관련 응급 경고 징후*에 유의하세요. 누구든지 다음과 같은 증상이 나타나면, 즉시 응급 의료 처치를 요청해야 합니다.'),
                                            text('- 호흡곤란'),
                                            text('- 가슴의 지속적인 통증 또는 압박'),
                                            text('- 전에 없던 혼란 증상'),
                                            text('- 깨어나지 못하거나 의식을 유지하지 못함'),
                                            text('- 파란빛의 입술 또는 얼굴'),
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