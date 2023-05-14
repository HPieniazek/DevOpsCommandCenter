import 'dart:convert';

import 'package:devops_command_center/wigets/navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/machine.dart';

class MachineProvider with ChangeNotifier {
  List<Machine> _machines = [];

  List<Machine> get machines => [..._machines];

  final String apiUrl = 'https://devopscommandcenterapi20230507123243.azurewebsites.net/Machines';

  MachineProvider () {
    fetchAndSetMachines();
  }
  
  Future<void> fetchAndSetMachines() async {
    final response = await http.get(Uri.parse(apiUrl));

    final List<Machine> loadedMachines = [];
    final extractedData = json.decode(response.body) as List<dynamic>;

    extractedData.forEach((machineData) {
      loadedMachines.add(Machine.fromJson(machineData));
    });

    _machines = loadedMachines;
    print('_machines: $_machines');
    notifyListeners();
  }

  Future<void> updateMachine(Machine updatedMachine) async {
    final machineIndex = _machines.indexWhere((mach) => mach.id == updatedMachine.id);

    if (machineIndex >= 0) {
      final url = '$apiUrl/${updatedMachine.id}';
      final response = await http.put(
        Uri.parse(url),
        body: json.encode(
          updatedMachine.toJson(),
        ),
      );

      if (response.statusCode >= 400) {
        // Handle error
      }

      _machines[machineIndex] = updatedMachine;
      notifyListeners();
    }
  }

  Future<void> deleteMachine(int id) async {
    final url = '$apiUrl/$id';
    final existingMachineIndex = _machines.indexWhere((mach) => mach.id == id);
    var existingMachine = _machines[existingMachineIndex];

    final response = await http.delete(Uri.parse(url));

    if (response.statusCode >= 400) {
      // Handle error
      _machines.insert(existingMachineIndex, existingMachine);
    } else {
      existingMachine = null!;
    }

    _machines.removeAt(existingMachineIndex);
    notifyListeners();
  }

  Future<void> addMachine(Machine machine, {required CustomNavigationBar bottomNavigationBar}) async {
    print('addMachine' + json.encode(machine));
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(machine),
    );
    final newMachine = Machine.fromJson(json.decode(response.body));

    _machines.add(newMachine);
    notifyListeners();
  }
}
