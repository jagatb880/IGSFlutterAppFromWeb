import 'package:flutter/material.dart';

class EachPage extends StatelessWidget {
  final String message;
  final String image;

  EachPage(this.message, this.image);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                  width: size.width,
                  height: size.height * 0.95,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
