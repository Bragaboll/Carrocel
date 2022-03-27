import 'package:app_carrocel/slide_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  dynamic currentPage = 0;

  final _listSlide = [
    {'id': 0, 'image': 'assets/images/img1.png'},
    {'id': 1, 'image': 'assets/images/img2.jpg'},
    {'id': 2, 'image': 'assets/images/img3.jpg'},
  ];
  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _listSlide.length,
                itemBuilder: (_, currentIndex) {
                  bool activePage = currentIndex == currentPage;
                  return SlideTile(
                    activePage: activePage,
                    image: _listSlide[currentIndex]['image'],
                  );
                },
              ),
            ),
            buildBullets(),
          ],
        ),
      ),
    );
  }

  Widget buildBullets() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((i) {
          return Container(
            margin: const EdgeInsets.all(10),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: currentPage == i['id'] ? Colors.red : Colors.black),
          );
        }).toList(),
      ),
    );
  }
}
