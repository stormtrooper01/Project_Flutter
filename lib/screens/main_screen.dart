import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/signin_page.dart';
import '../scoped-model/main_model.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import '../pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  final MainModel model;

  MainScreen({this.model});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;

  HomePage homePage;
  OrderPage orderPage;
  ProfilePage profilePage;

  List<Widget> pages;
  Widget currentPage;
  @override
  void initState() {
    widget.model.fetchAll();
    homePage = HomePage();
    orderPage = OrderPage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, profilePage];
    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  size: 30.0,
                  color: Colors.black,
                ),
                onPressed: () {}),
            currentTab == 3
                ? ScopedModelDescendant(builder:
                    (BuildContext context, Widget child, MainModel model) {
                    return IconButton(
                      icon: Icon(
                        Icons.logout,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => SignInPage()));
                        model.logout();
                      },
                    );
                  })
                : IconButton(
                    icon: _buildShoppingCart(),
                    onPressed: () {},
                  )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 25.0,
              ),
              title: Text("Home",
              style: new TextStyle(
                fontSize: 15.0,
                fontFamily: 'Roboto',
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search_sharp,
                size: 30.0,
              ),
              title: Text("Explore",
                style: new TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 25.0,
              ),
              title: Text("Orders",
              style: new TextStyle(
                fontSize: 15.0,
                fontFamily: 'Roboto',
              ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 25.0,
              ),
              title: Text("Profile",
              style: new TextStyle(
                fontSize: 15.0,
                fontFamily: 'Roboto',
              ),
              ),
            ),
          ],
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.yellow[800],
        ),
        body: currentPage,
      ),
    );
  }

  Widget _buildShoppingCart() {
    return Stack(
      children: <Widget>[
        Icon(
          Icons.shopping_cart,
          size: 30.0,
          color: Colors.black,
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            height: 12.0,
            width: 12.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
