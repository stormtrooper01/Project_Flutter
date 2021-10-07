import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoughtFood extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;

  BoughtFood(
      {this.id,
      this.name,
      this.imagePath,
      this.category,
      this.price,
      this.discount,
      this.ratings});

  @override
  _BoughtFoodState createState() => _BoughtFoodState();
}

class _BoughtFoodState extends State<BoughtFood> {
  var cardText = TextStyle(
      fontSize: 23.0,
      fontFamily: 'Roboto'
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12.0)
               ),
              height: 260.0,
              width: 370.0,
              child: Image(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              width: 370.0,
              height: 50.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.black45],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                right: 10.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 23.0,
                              fontFamily: 'Roboto',
                              color: Colors.yellow[800]),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 18.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 18.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 18.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 18.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white60,
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          widget.price.toString(),
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              color: Colors.yellow[800]),
                        ),
                        Icon(Icons.attach_money,
                        color: Colors.yellow[800],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
      )
    );
  }
}
