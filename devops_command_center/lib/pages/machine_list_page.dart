import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/machine.dart';
import 'machine_details_page.dart';

class MachineListPage extends StatefulWidget {
  @override
  _MachineListPageState createState() => _MachineListPageState();
}

class _MachineListPageState extends State<MachineListPage> {
  @override
  Widget build(BuildContext context) {
    var machines = Provider.of<MachineProvider>(context).machines;

    return Scaffold(
      appBar: AppBar(title: Text('Machines')),
      body: ListView.builder(
        itemCount: machines.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(machines[index].name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<MachineProvider>(context, listen: false).deleteMachine(machines[index].id);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MachineDetailsPage(
                    id: machines[index].id,
                    name: machines[index].name,
                    description: machines[index].description,
                    commands: machines[index].commands,
                    version: machines[index].version,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<MachineProvider>(context, listen: false).addMachine(
            Machine(
              id: Random().nextInt(1000),
              name: 'New Machine',
              description: 'This is a new machine',
              commands: ['command1', 'command2'],
              version: '1.0.0',
            ),
          );
        },
      ),
    );
  }
}
