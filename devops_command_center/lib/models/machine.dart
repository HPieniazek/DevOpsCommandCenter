class Machine {
  final int id;
  final String name;
  final String description;
  final List<String> commands;
  final String version;

  Machine({
    required this.id,
    required this.name,
    required this.description,
    required this.commands,
    required this.version,
  });

  // Konwersja z JSON na obiekt Machine
  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      commands: List<String>.from(json['commands']),
      version: json['version'],
    );
  }
  
   // Konwersja obiektu Machine na JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'commands': commands,
      'version': version,
    };
  }
}
