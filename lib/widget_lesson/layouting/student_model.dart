class StudentModel {
  String name;
  int age;
  String grade;

  StudentModel({required this.name, required this.age, required this.grade});

  @override
  String toString() {
    return 'StudentModel(name: $name, age: $age, grade: $grade)';
  }
}

// list of students 50
List<StudentModel> students = List.generate(
  50,
  (index) => StudentModel(
    name: 'Student $index',
    age: 18 + (index % 5), // Random age between 18 and 22
    grade: 'Grade ${index % 4 + 9}', // Random grade between 9 and 12
  ),
);
