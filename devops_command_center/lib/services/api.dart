import 'dart:convert';
import '../models/machine.dart';  // Import your Machine model
import 'package:http/http.dart' as http;

Future<List<Machine>> fetchMachines() async {
  final response = await http.get(
    Uri.parse('https://devopscommandcenterapi20230507123243.azurewebsites.net/Machines'),
  );
  print("response.body.toString()");
  print(response.body.toString());
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => Machine.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load machines from API');
  }
}
