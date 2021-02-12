import 'package:flutter/material.dart';

// import 'package:academy_project/pages/news_list_page.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Регистрация'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Login'),
                    keyboardType: TextInputType.text,
                    style: _sizeTextBlack,
                  ),
                  width: 400,
                ),
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    style: _sizeTextBlack,
                  ),
                  width: 400,
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Theme.of(context).accentColor,
                    height: 50.0,
                    minWidth: 150.0,
                    child: Text(
                      'Create account',
                      style: _sizeTextWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).accentColor,
                    height: 50.0,
                    minWidth: 150.0,
                    child: Text(
                      'Back',
                      style: _sizeTextWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
