import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int id;
  final String name;
  final String job;
  final String phone;
  final String imageUrl;
  final DateTime admissionDate;

  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        job = json['job'],
        admissionDate = DateTime.parse(json['admission_date']),
        imageUrl = json['image'],
        phone = json['phone'];

  @override
  List<Object?> get props => [
        id,
        name,
        job,
        phone,
        imageUrl,
        admissionDate,
      ];
}