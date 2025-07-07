import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/appcolor.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imageList = [
    "https://vrthumb.imagetoday.co.kr/2021/08/17/tit245t0142w1.jpg",
    "https://marketplace.canva.com/EAGfRkfk5SQ/1/0/1280w/canva-%ED%95%91%ED%81%AC%EC%83%89-%EB%B8%94%EB%9E%99-%EA%B7%80%EC%97%AC%EC%9A%B4-3d-%EC%9D%B4%EB%B2%A4%ED%8A%B8-%ED%8A%B9%EA%B0%80-%EC%84%B8%EC%9D%BC-%EA%B3%B5%EC%A7%80-%EC%9D%B8%EC%8A%A4%ED%83%80%EA%B7%B8%EB%9E%A8-%EA%B2%8C%EC%8B%9C%EB%AC%BC-LO3RMq-x7ss.jpg",
    "https://d2v80xjmx68n4w.cloudfront.net/members/portfolios/GyOyE1730102954.jpg?w=500",
    "https://i.pinimg.com/736x/13/ca/76/13ca76680f81b30b3f789abf928f7780.jpg",
    "https://marketplace.canva.com/EAF8BJnZxDI/1/0/1600w/canva-%EB%B9%A8%EA%B0%84%EC%83%89-%ED%9D%B0%EC%83%89-%ED%95%A0%EC%9D%B8-%EC%9D%B4%EB%B2%A4%ED%8A%B8-%EC%9D%B8%EC%8A%A4%ED%83%80%EA%B7%B8%EB%9E%A8-%ED%8F%AC%EC%8A%A4%ED%8A%B8-dcBGvfIv3dc.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.network(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
              height: 230,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (_current == entry.key
                          ? Colors.white.withOpacity(0.9)
                          : Colors.white.withOpacity(0.4)),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
