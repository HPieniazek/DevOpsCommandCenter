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

  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      commands: List<String>.from(json['commands'].map((x) => x)),
      version: json['version'],
    );
  }
}
