class ModelClass {
  final int id;
  final String name;
  final String department;

  ModelClass({
    required this.id,
    required this.name,
    required this.department,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) {
    return ModelClass(
      id: json['id'],
      name: json['name'],
      department: json['department'],
    );
  }
}
