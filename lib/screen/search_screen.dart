import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/model/model_movie.dart';
import 'package:my_app/screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: _filter,
            decoration: InputDecoration(
              hintText: "검색",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('movie').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              final docs = snapshot.data!.docs.where(
                (d) => d.data().toString().contains(_searchText),
              );

              return GridView.count(
                crossAxisCount: 3,
                children: docs.map((data) {
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
