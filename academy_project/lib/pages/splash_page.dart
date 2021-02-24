import 'dart:async';

import 'package:academy_project/pages/login_page.dart';
import 'package:academy_project/services/local_cash_service.dart';
// import 'package:academy_project/pages/news_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'news_list_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => nextPage());
  }

  Future<void> nextPage() async {
    final localCash = LocalCashServiceImpl();
    final token = await localCash.getString('token');
    if (token != null && token != '') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewsListPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/splash/News_Logo.png',
            height: 300.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          SpinKitWave(
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
