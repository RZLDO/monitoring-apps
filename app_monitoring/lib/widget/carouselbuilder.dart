import 'package:app_monitoring/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselBuilder extends StatefulWidget {
  const CarouselBuilder({super.key});
  @override
  State<CarouselBuilder> createState() => _CarouselBuilderState();
}

class _CarouselBuilderState extends State<CarouselBuilder> {
  int _index = 0;
  final urlImage = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrBA7Ygip4J490MrQLPMDF3_oaKBhHty_Suf8FsBM89g&s",
    "https://www.bankbsi.co.id/storage/promos/y8czscYT9eoH7Ln1EYmdxCo8aZ8bIItTT3K153Go.jpg",
    "http://blog.sayurbox.com/wp-content/uploads/2022/08/Promo-agustus-BSI-ELDP.jpg",
    "https://www.bankbsi.co.id/storage/promos/i8xI62aUTkEvhvpoQ1l4ozrM6UDVxiljDFGXYBJm.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider.builder(
              itemCount: urlImage.length,
              itemBuilder: ((context, index, realIndex) {
                final urlimage = urlImage[index];
                return ImageBuilder(urlimage, index);
              }),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                onPageChanged: (index, reason) {
                  setState(() {
                    _index = index;
                  });
                },
              )),
          SizedBox(
            height: 20,
          ),
          buildIndicator(),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
          activeDotColor: AppColor.orangeColor,
          spacing: 5.0,
          dotHeight: 7,
          dotWidth: 7),
      activeIndex: _index,
      count: urlImage.length);
  Widget ImageBuilder(String urlImage, int index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Image.network(
        urlImage,
        fit: BoxFit.fill,
      ));
}
