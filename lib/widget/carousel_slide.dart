import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_app/model/model_movie.dart';
import 'package:my_app/screen/detail_screen.dart';

class CarouseImage extends StatefulWidget {
  final List<Movie> movies;
  const CarouseImage({super.key, required this.movies});

  @override
  _CarouseImageState createState() => _CarouseImageState();
}

class _CarouseImageState extends State<CarouseImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;

  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.network(m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        CarouselSlider(
          items: images,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(_currentKeyword, style: TextStyle(fontSize: 11)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(likes[_currentPage] ? Icons.check : Icons.add),
                  onPressed: () {
                    setState(() {
                      likes[_currentPage] = !likes[_currentPage];
                      movies[_currentPage].reference.update({
                        'like': likes[_currentPage],
                      });
                    });
                  },
                ),
                Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 11)),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_arrow, color: Colors.black),
                  SizedBox(width: 3),
                  Text('재생', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailScreen(movie: movies[_currentPage]),
                      ),
                    );
                  },
                ),
                Text('정보', style: TextStyle(fontSize: 11)),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: makeIndicator(likes, _currentPage),
        ),
      ],
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  return List.generate(list.length, (index) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index
            ? Colors.white
            : Colors.white.withOpacity(0.4),
      ),
    );
  });
}
