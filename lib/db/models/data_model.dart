class StudentModel {
  int? id;
  final String name;
  final String age;
  StudentModel({
    this.id,
    required this.name,
    required this.age,
  });

  static StudentModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final age = map['age'] as String;

    return StudentModel(id: id, name: name, age: age);
  }
}
