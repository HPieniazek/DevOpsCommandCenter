import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/machine.dart';
import '../services/machine_provider.dart';

class MachineDetailsPage extends StatefulWidget {
  final int id;
  String name;
  String description;
  List<String> commands;
  String version;

  MachineDetailsPage({
    required this.id,
    required this.name,
    required this.description,
    required this.commands,
    required this.version,
  });

  @override
  _MachineDetailsPageState createState() => _MachineDetailsPageState();
}

class _MachineDetailsPageState extends State<MachineDetailsPage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _versionController;
  late TextEditingController _commandController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _descriptionController = TextEditingController(text: widget.description);
    _versionController = TextEditingController(text: widget.version);
    _commandController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _versionController.dispose();
    _commandController.dispose();
    super.dispose();
  }

  void _updateMachine() {
    var updatedMachine = Machine(
      id: widget.id,
      name: _nameController.text,
      description: _descriptionController.text,
      commands: widget.commands,
      version: _versionController.text,
    );

    Provider.of<MachineProvider>(context, listen: false).updateMachine(updatedMachine);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _updateMachine,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${widget.id}',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            Text(
              'Name:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextFormField(
              controller: _nameController,
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextFormField(
              controller: _descriptionController,
            ),
            SizedBox(height: 16),
            Text(
              'Commands:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ...widget.commands.map((command) {
              final commandController = TextEditingController(text: command);
              return Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: commandController,
                      onChanged: (value) {
                        command = value;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget.commands.remove(command);
                      });
                    },
                  ),
                ],
              );
            }).toList(),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _commandController,
                    decoration: InputDecoration(hintText: 'Enter new command'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_commandController.text.isNotEmpty) {
                      setState(() {
                        widget.commands.add(_commandController.text);
                        _commandController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Version:',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextFormField(
              controller: _versionController,
            ),
          ],
           ),
      ),
    );
  }
}
