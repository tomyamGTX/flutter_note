class Student {
  String name;
  String? age;
  String address;

  Student({required this.name, this.age,required this.address});
}

List<Student> studentList = [
  Student(name: 'Hakimi', age: '22', address: 'Kedah'),
  Student(name: 'Ihsan', age: '22', address: 'Johor'),
  Student(name: 'Dani', address: 'Kelantan')
];
