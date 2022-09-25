import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  int initialIndex = 0;
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    List images = res.images as List;

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("${res.category}"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: _height * 0.55,
                autoPlay: true,
                enlargeCenterPage: true,
                initialPage: initialIndex,
                onPageChanged: (i, _) {
                  setState(() {
                    initialIndex = i;
                  });
                }),
            items: images.map((e) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(
                    image: AssetImage("$e"),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          AnimatedSmoothIndicator(
            count: images.length,
            activeIndex: initialIndex,
            onDotClicked: (i) {
              setState(() {
                initialIndex = i;
              });
            },
            effect: const JumpingDotEffect(),
          ),
        ],
      ),
    );
  }
}
