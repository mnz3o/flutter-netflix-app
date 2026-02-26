import 'package:flutter/material.dart';
import 'package:my_app/model/model_movie.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;

  const BoxSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('지금 뜨는 콘텐츠'),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies
                  .map(
                    (movie) => Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Image.network(movie.poster),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
