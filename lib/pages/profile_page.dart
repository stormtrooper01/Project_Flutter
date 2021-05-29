import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/user_info_model.dart';
import '../scoped-model/main_model.dart';
import '../widgets/small_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        UserInfo userInfo = model.getUserDetails(model.authtenticatedUser.id);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'Roboto'
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3.0,
                                offset: Offset(0, 4.0),
                                color: Colors.black38),
                          ],
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/profile.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${userInfo.username}",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "${userInfo.email}",
                            style: TextStyle(color: Colors.grey,
                            fontSize: 18.0
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          SmallButton(btnText: "Edit"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Icon(Icons.add_location,
                              color: Colors.yellow[800],
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Location',
                              style: new TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20.0
                              ),
                              )
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          Row(
                            children: [
                              Icon(Icons.vpn_key,
                              color: Colors.yellow[800],
                                size: 25.0,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text('Change password',
                                style: new TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20.0
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto'
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "App Notification",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Robto'
                                ),
                              ),
                              Switch(
                                value: turnOnNotification,
                                onChanged: (bool value) {
                                  // print("The value: $value");
                                  setState(() {
                                    turnOnNotification = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            height: 10.0,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Location Tracking",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: 'Roboto'
                                ),
                              ),
                              Switch(
                                value: turnOnLocation,
                                onChanged: (bool value) {
                                  // print("The value: $value");
                                  setState(() {
                                    turnOnLocation = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
