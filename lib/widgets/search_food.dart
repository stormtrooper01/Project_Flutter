import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      child: TextField(
        style:TextStyle(color: Colors.black, fontSize: 16.0),
        cursorColor: Theme.of(context).primaryColor,
        decoration:InputDecoration(
          suffixIcon: Icon(Icons.search_sharp,
          color: Colors.yellow[800],
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
          border:InputBorder.none,
          hintText: "Search for food"
        )
      ),
    );
  }
}
