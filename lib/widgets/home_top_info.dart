import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget{
  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);
  
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("What would",
                  style: new TextStyle(
                  fontSize: 40.0,
                    fontFamily: 'Roboto',
                    color: Colors.yellow[800],
                  ),
              ),
              Text("you like to order?",
                style: new TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Roboto',
                  color: Colors.yellow[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
