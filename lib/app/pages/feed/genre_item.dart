import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:k_central_app/app/pages/feed/feed_controller.dart';


class GenreItem extends StatelessWidget {
  GenreItem({this.name, this.url, this.id});


  final String name;
  final String url;
  final int id;

  @override
  Widget build(BuildContext context) {
    final feedController = Modular.get<FeedController>();
    return Observer(
      builder: (_) => Row(
        children: <Widget>[
          // Text(feedState.counter.toString()),
          SizedBox(
            width: id == 0 ? 15 : 5.0,
          ),
          GestureDetector(
            onTap: () => feedController.setCurrentTag(id),
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: feedController.currentTag == id ? Colors.pinkAccent : Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                        color: feedController.currentTag == id ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
