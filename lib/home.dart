import 'package:flutter/material.dart';
import 'mes.dart';
import 'semana.dart';
import 'retardo.dart';
import 'loginpage.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Semana();
      case 1:
        return Mes();
      case 2:
        return Retardo();
      case 3:
        return LoginPage();
    }
  }

  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liberador'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Liberador'),
              accountEmail: Text('libeardor@uth.edu.mx'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 192, 214, 233),
                child: Text(
                  'J',
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Semana Actual'),
              leading: Icon(Icons.today),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Mes'),
              leading: Icon(Icons.calendar_month),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text('Retardo'),
              selected: (2 == _selectDrawerItem),
              leading: Icon(Icons.access_time_filled),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              selected: (3 == _selectDrawerItem),
              leading: Icon(Icons.logout),
              onTap: () {
                _onSelectItem(3);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}
