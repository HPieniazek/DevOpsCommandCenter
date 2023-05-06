import 'package:devops_command_center/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'pages/machine_list_page.dart';
import 'package:flutter/widgets.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevOps Command Center',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
      ),
      home: LoginPage(),
      
    );
  }
}





