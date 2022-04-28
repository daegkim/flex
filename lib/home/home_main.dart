import 'package:flex/home/home_category.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:developer';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  _HomeWidgetState();

  int navIndex = 1;

  Widget getBody() {
    Widget result;
    List<String> urls = [
      'https://image.nbkorea.com/NBRB_Product/20210806/NB20210806162628108001.jpg',
      'https://image.nbkorea.com/NBRB_Product/20210806/NB20210806162642549001.jpg',
      'https://image.nbkorea.com/NBRB_Product/20210806/NB20210806162654187001.jpg',
      'https://image.nbkorea.com/NBRB_Product/20210806/NB20210806162707157001.jpg',
    ];

    switch(navIndex) {
      case 0:
        result = const Text('Guide');
        break;
      case 1:
        result = CarouselSlider.builder(
          itemCount: urls.length,
          itemBuilder: (context, index, realIndex) {
            final url = urls[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.grey,
              child: GestureDetector(
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                onTap: () {
                  log(index.toString());
                },
              ),
            );
          },
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            enlargeCenterPage: true,
          ),
        );
        break;
      case 2:
        result = const Text('Favorite');
        break;
      default:
        result = const Text('Default');
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    const List<String> categories = ["주말특가", "추천", "랭킹", "업데이트", "코디", "세일", "스페셜", "매거진", "TV", "이벤트"];
    // 전체를 가득 채우는 방법
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('FLEX'),
      ),
      body: Column(
        children: [
          const HomeCategoryWidget(categories: categories),
          getBody(),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        items: const [
          BottomNavigationBarItem(label: 'guide', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'favorite', icon: Icon(Icons.favorite)),
        ],
        onTap: (idx) {
          setState(() {
            navIndex = idx;
          });
        },
      ),
    );
  }
}