import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel Slider',
      home: CarouselWidget(),
    );
  }
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nostra'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(

            // Set carousel controller
            carouselController: carouselController,
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ));
                },
              );
            }).toList(),
            options: CarouselOptions(

              // Set the height of each carousel item
              height: 400,

              // Set the size of each carousel item
              // if height is not specified
              aspectRatio: 16 / 9,

              // Set how much space current item widget
              // will occupy from current page view
              viewportFraction: 0.8,

              // Set the initial page
              initialPage: 0,

              // Set carousel to repeat when reaching the end
              enableInfiniteScroll: true,

              // Set carousel to scroll in opposite direction
              reverse: false,

              // Set carousel to display next page automatically
              autoPlay: true,

              // Set the duration of which carousel slider will wait
              // in current page utill it moves on to the next
              autoPlayInterval: const Duration(seconds: 3),

              // Set the duration of carousel slider
              // scrolling to the next page
              autoPlayAnimationDuration: const Duration(milliseconds: 800),

              // Set the carousel slider animation
              autoPlayCurve: Curves.fastOutSlowIn,

              // Set the current page to be displayed
              // bigger than previous or next page
              enlargeCenterPage: true,

              // Do actions for each page change
              onPageChanged: (index, reason) {},

              // Set the scroll direction
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(height: 20),

          // Change page on each tap
          ElevatedButton(
            onPressed: () => carouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
