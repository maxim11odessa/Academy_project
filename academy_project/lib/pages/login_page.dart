// import 'package:academy_project/pages/news_list_page.dart';
import 'package:academy_project/pages/new_account.dart';
import 'package:academy_project/pages/news_list_page.dart';
import 'package:flutter/material.dart';
import 'package:academy_project/services/local_cash_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _sizeTextBlack = const TextStyle(fontSize: 20.0, color: Colors.black);

  final _sizeTextWhite = const TextStyle(fontSize: 20.0, color: Colors.white);

  final _loginController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _loginController.dispose();
    super.dispose();
  }

  Future<void> onLogin() async {
    final localCash = LocalCashServiceImpl();
    final value = _loginController.text;
    if (value != null && value != '') {
        localCash.setString('token', value);
         Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewsListPage()));
    }
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Главное меню'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    controller: _loginController,
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
                    onPressed: () => onLogin(),
                    color: Theme.of(context).accentColor,
                    height: 50.0,
                    minWidth: 150.0,
                    child: Text(
                      'LOGIN',
                      style: _sizeTextWhite,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration()));
                    },
                    color: Theme.of(context).accentColor,
                    height: 50.0,
                    minWidth: 150.0,
                    child: Text(
                      'Add account',
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
