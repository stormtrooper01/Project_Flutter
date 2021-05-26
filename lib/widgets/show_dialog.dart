import 'package:flutter/material.dart';

Future<void> showLoadingIndicator(BuildContext context, String message) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow[800]),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text("$message"),
            ],
          ),
        );
      });
}
