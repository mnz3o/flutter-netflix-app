import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/model_movie.dart';
import 'package:my_app/screen/detail_screen.dart';

class LikeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        Text('내가 찜한 콘텐츠'),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('movie')
                .where('like', isEqualTo: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return GridView.count(
                crossAxisCount: 3,
                children: snapshot.data!.docs.map((data) {
                  final movie = Movie.fromSnapshot(data);
                  return InkWell(
                    child: Image.network(movie.poster),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(movie: movie),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
