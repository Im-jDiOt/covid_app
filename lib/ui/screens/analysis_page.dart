import 'package:flutter/material.dart';
import 'package:covid_app/ui/widgets/Widgets.dart';

class AnalysisPage extends StatefulWidget {
  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  //int _selectedItem = 0;
  var _pages = [FirstPage(), SecondPage(), ThirdPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3D1472),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: PageView(
        children: _pages,
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                                '< 1 >\n감염병 수리 모델',
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
                                  left: 30, right: 30, bottom: 30),
                              child: Column(
                                children: [
                                  text(
                                      text:
                                          "감염병 수리모델이란 감염병이 퍼져 나가는 상태를 나타내는 수학식을 만들어 전파 상황을 분석하고 향후 전개될 양상을 예측하는데 활용되는 분석 모델입니다. "
                                          "이러한 모델은 방역 정책의 방향을 설정하는데 도움을 줍니다.\n\n"
                                          "감염병 수리모델은 인구집단을 어떻게 분류하냐에 따라 여러 종류로 나눌 수 있습니다. "
                                          "취약자와 감염자로만 나누기도 하고, 취약자, 감염자, 회복자, 또는 이 모델에 잠복기를 고려해 노출자를 추가하기도 합니다. "
                                          "또 감염병 유행 중의 출생자, 사망자 수나 회복자의 재감염을 고려하기도 합니다. "
                                          "더 나아가 각각 질병마다의 특징을 생각해 모델링하기도 합니다.",
                                      size: size),
                                  image(
                                      image: 'lib/assets/epidemic models.PNG',
                                      size: size),
                                  text(
                                      text:
                                          "각 변수의 고려여부에 따라 위와 같이 나뉠 수 있습니다. 이 중 SIR 모델과 SEIR 모델에 대해 뒤에서 더 알아보고 파이썬을 이용해 해당 모델을 코딩해보도록 하겠습니다. \n\n"
                                          "감염병 예측에서 수리 모델 말고도 자주 나오는 개념이 있습니다. R0가 바로 그것인데, 조지 맥도널드(George Macdonald)가 기초 감염 재생산지수를 의미하는 R0를 처음으로 정의했습니다.\n\n"
                                          "R0는 어떤 집단에서 최초로 감염자가 발생했을 때, 그 결과로 인해 생긴 이차감염자의 수입니다. 예를 들어 1918년 스페인 독감의 R0는 1.8이었는데, 이는 한 감염자가 약 2명의 사람에게 전파할 것이라는 의미입니다. R0가 1보다 크면 대유행이 발생하고, 1과 같으면 풍토병이, 그보다 작으면 종식됩니다.",
                                      size: size),
                                  image(
                                      image: 'lib/assets/R0 graph.PNG',
                                      size: size),
                                  text(
                                      text:
                                          "Ro 는 병원체의 전염성과 인구, 밀도, 사회 조직, 계절성 등에 영향을 받습니다. COVID-19의 경우 초기에는 2~3 정도로 보았으나, 현재는 1 초중반으로 예측됩니다. 사회적 거리두기, 자가 격리 등의 정책이 적용된 결과라고 해석할 수 있습니다. 앞으로도 방역 수칙을 준수하며 다같이 코로나 바이러스의 종식을 위해 노력해야할 것입니다.",
                                      size: size)
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

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                                '<2>\nSIR 모델',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: size.width * 0.12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: size.width*0.2+60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 30),
                              child: Column(
                                children: [
                                  text(
                                      text:
                                          "SIR 모델은 1927년 스코틀랜드의 생화학자 켈멕(William Ogilvy Kermack)과 스코틀랜드 병리학자 멕켄드릭(Anderson Gray McKendric)이 감염병이 유행할 때 감염자의 수를 예측하기 위해 개발한 감염확산모델입니다.\n\n"
                                          "SIR 모델은 잠복기가 없고, 완치 후에는 이 병에 대한 면역이 생겨서 더이상 감염되지 않게 되는 질병을 가정합니다. 홍역, 풍진 등에 이에 해당합니다.\n\n"
                                          "SIR 모델의 S, I, R은 각각 Susceptible, Infectious, Recovered의 초성으로, 취약자, 감염자, 완치자를 의미합니다. 이 외에 dS/dt는 취약자의 변화 비율, dI/dt는 감염자의 변화 비율, dR/dt는 완치자의 변화비율, β는 감염의 효과율( = 1명의 감염자가 병을 전파시킬 확률을 조절하는 수), γ는 회복률( = 1/병 지속 시간), N은 전체 인원을 의미합니다.",
                                      size: size),
                                  image(
                                      image:
                                          'lib/assets/variables in sir model.PNG',
                                      size: size),
                                  text(
                                      text:
                                          '지금부터는 S,I,R의 변화 비율을 구해보도록 하겠습니다. \n\n'
                                          '생각해봅시다. 감염은 어떤 변수의 영향을 받을까요? 1) 얼만큼 효과적으로 감염시키는지(=β), 그리고 2) 감염시키는 수가 얼만큼 많은지(=I)에 따라 감염의 강도가 결정될 것입니다. 그리고 그 감염의 강도에 따라 취약자(=S)가 감염자(=I)로 “변화”할 것입니다. 따라서 우리는,',
                                      size: size),
                                  image(
                                      image: 'lib/assets/expression1.PNG',
                                      size: size),
                                  text(
                                      text: '라고 말할 수 있습니다.\n\n'
                                          '그리고 그 감염자로 변화한 양만큼 취약자의 수가 줄 것이므로,',
                                      size: size),
                                  image(
                                      image: 'lib/assets/expression2.PNG',
                                      size: size),
                                  text(
                                      text: '임을 알 수 있습니다.\n\n'
                                          '또, 시간에 따른 완치자의 수는 회복률과, 그 회복률이 적용되는 대상인 감염자의 수에 영향을 받을 것입니다. 그렇기에,',
                                      size: size),
                                  image(
                                      image: 'lib/assets/expression3.PNG',
                                      size: size),
                                  text(
                                      text:
                                          '라고 말할 수 있으며, 이때 회복된 수만큼 기존의 감염자 수가 줄 것이므로 감염자 수를 다시 생각해보면, ',
                                      size: size),
                                  image(
                                      image: 'lib/assets/expression4.PNG',
                                      size: size),
                                  text(
                                      text: '라고 볼 수 있습니다.\n\n'
                                          '정리하자면 각 변수의 변화율은 다음과 같습니다.',
                                      size: size),
                                  image(
                                    image: 'lib/assets/expression5.PNG',
                                    size: size
                                  ),
                                  text(
                                    text: '여기서 잠깐 감염자 수의 변화율을 좀 더 깊게 보도록 합시다. 감염자 수의 변화율이 1보다 클 경우, 그 수는 점점 증가할 것입니다. 즉, βSI - γI > 0이면 감염자 수는 증가합니다. 이항하고 γI로 나누면, βS/γ > 1 일 때 감염자 수가 증가함을 알 수 있고, 이 전에서 본 R0의 정의와 같음을 통해 R0 = βS/γ임을 유도해낼 수 있습니다.',
                                    size: size
                                  ),
                                  image(
                                    image: 'lib/assets/expression6.PNG',
                                    size: size
                                  ),
                                  text(
                                    text: '다시 돌아와 위 미분방정식을 풀고 수치해를 구해 그 그래프를 그리면 다음과 같은 그래프가 나옵니다.',
                                    size: size
                                  ),
                                  image(
                                    image: 'lib/assets/sir model graph.PNG',
                                    size: size
                                  ),
                                  text(
                                    text: '여기까지가 SIR 모델에 대한 설명입니다. 아래는 미분방정식을 풀어 그래프를 그려주는 파이썬 코드입니다.',
                                    size: size
                                  ),
                                  image(
                                    image: 'lib/assets/sir model code1.PNG',
                                    size: size
                                  ),
                                  image(image: 'lib/assets/sir model code2.PNG',
                                  size: size)
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

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                                '<3>\nSEIR 모델',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: size.width * 0.12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: size.width*0.2+60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 30),
                              child: Column(
                                children: [
                                  text(
                                      text:
                                      "SEIR 모델은 SIR 모델에 Exposed, 즉 접촉자 수를 포함한 모델입니다. 접촉자 수를 포함함으로써 SIR 모델과 달리 잠복기를 고려할 수 있습니다. 노출군에서 감염군으로 이동 즉, 잠복기를 고려한 모형으로 보다 현실적이라고 할 수 있습니다. 그렇기에 이 SEIR 모델이 전 세계적으로 감염병 예방과 예측을 위해 보편적으로 사용되는 수리적 모델링 방식이라고 말 할 수 있습니다.",
                                      size: size),
                                  image(
                                      image:
                                      'lib/assets/expression7.PNG',
                                      size: size),
                                  text(
                                      text: "위 식은 SEIR 모델의 미분 방정식입니다. 식은 이 전의 SIR 모델식을 세우는 것과 비슷하게 진행되므로 생략하도록 하겠습니다. σ는 지연시간(latency),즉 잠복기를 의미합니다.",
                                      size: size),
                                  image(
                                      image: 'lib/assets/seir model code.PNG',
                                      size: size),
                                  image(
                                      image: 'lib/assets/seir model code2.PNG',
                                      size: size),
                                  text(
                                      text: "SEIR 모델을 파이썬으로 작성한 코드입니다.\n\n 이를 실행시키면 다음과 같은 그래프를 얻을 수 있습니다.",
                                      size: size),
                                  image(
                                      image: 'lib/assets/seir model graph.PNG',
                                      size: size),
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

Widget text({String text, Size size}) {
  return Column(
    children: [
      Text(
        text,
        style: TextStyle(fontSize: size.width * 0.04),
      ),
      SizedBox(
        height: size.width * 0.04,
      ),
    ],
  );
}

Widget image({String image, Size size}) {
  return Column(
    children: [
      Container(child: Image.asset(image)),
      SizedBox(
        height: size.width * 0.04,
      ),
    ],
  );
}