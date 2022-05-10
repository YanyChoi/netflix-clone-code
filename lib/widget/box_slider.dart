import 'package:first_flutter/model/model_movie.dart';
import 'package:first_flutter/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class BoxSlider extends StatelessWidget {
  final dynamic movies;

  BoxSlider({this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 뜨는 컨텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies),
            ),
          )
        ],
      ),);
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(onTap: () {
      Navigator.of(context).push(MaterialPageRoute<Null>(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return DetailScreen(
              movie: movies[i],
            );
          }));
    },
      child: Container(padding: EdgeInsets.only(right: 10),
        child: Image.asset('images/' + movies[i].poster),
      ),
    ),);
  }

  return results;
}