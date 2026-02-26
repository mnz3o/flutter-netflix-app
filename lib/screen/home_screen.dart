import 'package:flutter/material.dart';
import 'package:my_app/model/model_movie.dart';
import 'package:my_app/widget/box_slider.dart';
import 'package:my_app/widget/carousel_slide.dart';
import 'package:my_app/widget/circle_slider.dart';

class HomeScreen extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'The Glory',
      keyword: '복수, 드라마',
      poster: 'https://via.placeholder.com/300x400',
    ),
    Movie(
      title: 'Squid Game',
      keyword: '서바이벌, 스릴러',
      poster: 'https://via.placeholder.com/300x400',
    ),
    Movie(
      title: 'Kingdom',
      keyword: '좀비, 사극',
      poster: 'https://via.placeholder.com/300x400',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          CarouseImage(movies: movies),
          CircleSlider(movies: movies),
          BoxSlider(movies: movies),
        ],
      ),
    );
  }
}
