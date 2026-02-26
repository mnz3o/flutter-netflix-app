import 'package:flutter/material.dart';
import 'package:my_app/model/model_movie.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;

  const CircleSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('미리보기'),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: movies
                  .map(
                    (movie) => Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(movie.poster),
                        radius: 40,
                      ),
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
