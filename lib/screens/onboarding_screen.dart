import 'package:coursdaresmt/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Widget> onBoardingList = [];
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
    super.initState();
    onBoardingList = [
       const OnBoardingWidget(
          photo: "ob1.jpg",
          title: "Dalal ak Jam ci Orange et moi",
          desc:
              "L'application pour gérer vos offres internet et mobile facilement."),
      const OnBoardingWidget(
          photo: "ob2.jpg",
          title: "Suivre ma consommation",
          desc:
              "L'application pour gérer vos offres internet et mobile facilement."),
      const OnBoardingWidget(
          photo: "ob3.jpg",
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: 430,
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          selectedPage = page;
                        });
                      },
                      children: onBoardingList,
                    ),
                    Positioned(
                      bottom: 175,
                      left: 0,
                      right: 0,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: PageViewDotIndicator(
                          currentItem: selectedPage,
                          count: 3,
                          unselectedColor:
                              const Color(0xffff6e01).withOpacity(0.5),
                          selectedColor: const Color(0xffff6e01),
                          duration: const Duration(milliseconds: 200),
                          boxShape: BoxShape.circle,
                          size: const Size(8, 8),
                          unselectedSize: const Size(6, 6),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    },));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffff6e01),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                  ),
                  child: const Text("J'accède")),
            )
          ],
        ));
  }
}

class OnBoardingWidget extends StatelessWidget {
  final String photo, title, desc;

  const OnBoardingWidget(
      {Key? key, required this.photo, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 15
        ),
        child: Center(
            child: Column(
          children: [
            Image.asset(
              "$imgUri$photo",
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Text(
                title,
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
                desc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
