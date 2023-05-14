import 'package:devops_command_center/pages/login_page.dart';
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

class MachineProvider with ChangeNotifier {
  List<Machine> _machines = [
    Machine(
      id: 1,
      name: 'Windows Machine',
      description: 'This is an example machine',
      commands: ['command1', 'command2'],
      version: '1.0.0',
    ),
    Machine(
      id: 2,
      name: 'Linux Machine',
      description: 'This is an example machine',
      commands: ['command1', 'command2'],
      version: '1.0.1',
    ),
  ];

  List<Machine> get machines => [..._machines];

  void updateMachine(Machine updatedMachine) {
    var index = _machines.indexWhere((machine) => machine.id == updatedMachine.id);
    if (index != -1) {
      _machines[index] = updatedMachine;
      notifyListeners();
    }
  }
    
  void deleteMachine(int id) {
    _machines.removeWhere((machine) => machine.id == id);
    notifyListeners();
  }

  void addMachine(Machine machine) {
    _machines.add(machine);
    notifyListeners();
  }
}






