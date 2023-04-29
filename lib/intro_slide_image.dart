// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:indian_genius_search/each_page.dart';
import 'package:indian_genius_search/webpage.dart';
import 'indicator.dart';

class IntroSlidePage extends StatefulWidget {
  const IntroSlidePage({Key? key}) : super(key: key);

  @override
  State<IntroSlidePage> createState() => _IntroSlidePageState();
}

class _IntroSlidePageState extends State<IntroSlidePage> {
  final controller = PageController();

  final messages = ["First Screen", "Second Screen", "Third Screen"];
  final images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg'
  ];

  int numberOfPages = 3;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Stack(children: <Widget>[
            PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: numberOfPages,
              itemBuilder: (BuildContext context, int index) {
                bool showSkip = true;
                if (index == 2) showSkip = false;
                return EachPage(messages[index], images[index]);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Flexible(child: Container()),
                    Flexible(
                      child: Indicator(
                        controller: controller,
                      ),
                    ),
                    Flexible(
                      child: (currentPage == numberOfPages - 1)
                          ? GestureDetector(
                              onTap: () {},
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // await UserPreferences.setFirstTimeUser();
                                    await Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebPage()),
                                    );
                                  },
                                  child: Text("Done",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                controller.jumpToPage(numberOfPages - 1);
                              },
                              child: Center(
                                child: Text(
                                  "Skip",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
