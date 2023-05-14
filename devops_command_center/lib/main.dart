import 'package:devops_command_center/pages/login_page.dart';
import 'package:devops_command_center/services/machine_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/machine.dart';
import 'pages/machine_list_page.dart';
import 'package:flutter/widgets.dart';
void main() => runApp(
    ChangeNotifierProvider(
      create: (context) => MachineProvider(),
      child: MyApp(),
    ),);
    
  

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








