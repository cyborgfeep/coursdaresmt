import 'package:coursdaresmt/models/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoarding> onBoardingList = [];

  List<Widget> generateListCustomTabs(List<OnBoarding> obList) {
    return List.generate(
      obList.length,
      (index) => Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            Image.network(
              obList[index].photo!,
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Text(
                obList[index].title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text(
                obList[index].desc!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    onBoardingList = [
      OnBoarding(
          photo: "https://picsum.photos/${300 + 0}",
          title: "Dalal ak Jam ci Orange et moi",
          desc:
              "L'application pour gérer vos offres internet et mobile facilement."),
      OnBoarding(
          photo: "https://picsum.photos/${300 + 1}",
          title: "Suivre ma consommation",
          desc:
              "L'application pour gérer vos offres internet et mobile facilement."),
      OnBoarding(
          photo: "https://picsum.photos/${300 + 2}",
          title: "Acheter du crédit et des pass",
          desc:
              "L'application pour gérer vos offres internet et mobile facilement.")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 430,
              child: IntroSlider(
                key: UniqueKey(),
                listCustomTabs: generateListCustomTabs(onBoardingList),
                isShowNextBtn: false,
                isShowSkipBtn: false,
                isShowDoneBtn: false,
                isShowPrevBtn: false,
                indicatorConfig: const IndicatorConfig(
                  colorIndicator: Color(0xffff6e01),
                  sizeIndicator: 8.0,
                  typeIndicatorAnimation: TypeIndicatorAnimation.sizeTransition,
                ),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("J'accède"))
          ],
        ));
  }
}
