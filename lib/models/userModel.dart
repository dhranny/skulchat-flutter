class User{

  String name;
  String password;
  String gmail;

  User(this.name, this.password, this.gmail);

  Map toJson() => {
      'name': name,
      'password': password,
      'gmail': gmail,
  };

}

class Course{

  String id;
  String name;
  String courseCode;

  Course({required this.id, required this.name, required this.courseCode});
  factory Course.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'id': String id,
      'name': String name,
      'courseCode': String courseCode,
      } =>
          Course(
            id: id,
            name: name,
            courseCode: courseCode,
          ),
      _ => throw const FormatException('Failed to load course.'),
    };
  }

}
