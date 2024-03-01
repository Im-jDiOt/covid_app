import 'package:flutter/material.dart';
import 'package:covid_app/ui/widgets/Widgets.dart';

class MorePage3 extends StatefulWidget {
  @override
  _MorePage3State createState() => _MorePage3State();
}

class _MorePage3State extends State<MorePage3> {
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
          child: Column(children: <Widget>[
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
                                '<3>\n특징',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: '정의\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                        text('- SARS-CoV-2 감염에 의한 호흡기 증후군'),
                                        text(
                                            '- 코로나 바이이러스(CoV)는 사람과 다양한 동물에 감염될 수 있는 바이러스로서 유전자 크기 27~32kb의 RNA 바이러스'),
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '병원체\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                        text('- SARS-CoV-2 : '),
                                        text('Coronaviridae에 속하는 RNA 바이러스'),
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '전파 경로\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text('현재까지는 비말(침방울), 접촉을 통한 전파로 알려짐'),
                                            text('- 기침이나 재채기를 할 때 생긴 비말(침방울)을 통한 전파 등'),
                                            text('- 코로나19 바이러스에 오염된 물건을 만진 뒤 눈, 코, 입을 만짐'),
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '잠복기\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text('- 1~14일 (평균 4~7일)'),
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '치료\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text('- 대증 치료 : 수액 보충, 해열제 등 보존적 치료'),
                                            text('- 특이적인 항바이러스제 없음'),
                                          ])),
                                  RichText(
                                      text: TextSpan(
                                          text: '치명률\n\n',
                                          style: title(),
                                          children: <TextSpan>[
                                            text('- 전세계 치명률은 약 3.4%(WHO, 3.5 기준)\n단, 국가별 · 연령별 치명률 수준은 매우 상이함'),
                                            text('- 고령, 면역기능이 저하된 환자, 기저질환을 가진 환자가 주로 중증, 사망 초래'),
                                          ])),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
