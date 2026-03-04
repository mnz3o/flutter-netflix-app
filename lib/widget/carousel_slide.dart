import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/model/model_movie.dart';

class CarouseImage extends StatelessWidget {
  final List<Movie> movies;

  const CarouseImage({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: movies.map((movie) => Image.network(movie.poster)).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlay: true,
      ),
    );
  }
}
