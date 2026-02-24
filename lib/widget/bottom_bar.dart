import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60,
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white60,
        indicatorColor: Colors.transparent,
        tabs: [
          Tab(icon: Icon(Icons.home), text: '홈'),
          Tab(icon: Icon(Icons.search), text: '검색'),
          Tab(icon: Icon(Icons.save), text: '찜'),
          Tab(icon: Icon(Icons.list), text: '더보기'),
        ],
      ),
    );
  }
}
