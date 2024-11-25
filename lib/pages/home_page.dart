import 'package:betalent/models/employee.dart';
import 'package:betalent/widgets/app_search_bar.dart';
import 'package:betalent/widgets/app_table.dart';
import 'package:betalent/widgets/page_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Employee> _employees;

  @override
  void initState() {
    super.initState();
    _employees = [
      {
        "id": 1,
        "name": "João",
        "job": "Back-end",
        "admission_date": "2019-12-02T00:00:00.000Z",
        "phone": "5551234567890",
        "image":
            "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
      },
      {
        "id": 2,
        "name": "Roberto",
        "job": "Front-end",
        "admission_date": "2020-03-12T00:00:00.000Z",
        "phone": "5550321654789",
        "image":
            "https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png"
      },
      {
        "id": 3,
        "name": "Maria",
        "job": "Front-end",
        "admission_date": "2020-03-15T00:00:00.000Z",
        "phone": "5557894561230",
        "image":
            "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
      },
      {
        "id": 4,
        "name": "Cleber",
        "job": "Back-end",
        "admission_date": "2020-06-01T00:00:00.000Z",
        "phone": "5557410258963",
        "image":
            "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
      },
      {
        "id": 5,
        "name": "Giovana",
        "job": "Designer",
        "admission_date": "2020-06-20T00:00:00.000Z",
        "phone": "5553698520147",
        "image":
            "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
      },
      {
        "id": 6,
        "name": "Mario",
        "job": "Front-end",
        "admission_date": "2020-10-01T00:00:00.000Z",
        "phone": "5551234567890",
        "image":
            "https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png"
      },
      {
        "id": 7,
        "name": "Gabriel",
        "job": "Back-end",
        "admission_date": "2021-01-01T00:00:00.000Z",
        "phone": "5551234567890",
        "image":
            "https://img.favpng.com/25/7/23/computer-icons-user-profile-avatar-image-png-favpng-LFqDyLRhe3PBXM0sx2LufsGFU.jpg"
      },
      {
        "id": 8,
        "name": "Carla",
        "job": "Back-end",
        "admission_date": "2021-03-01T00:00:00.000Z",
        "phone": "5551234567890",
        "image":
            "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
      },
      {
        "id": 10,
        "name": "Fernanda",
        "job": "Front-end",
        "admission_date": "2021-05-01T00:00:00.000Z",
        "phone": "5551234567890",
        "image":
            "https://www.clipartmax.com/png/middle/277-2772117_user-profile-avatar-woman-icon-avatar-png-profile-icon.png"
      }
    ].map(Employee.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: PageTitle('Funcionários'),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AppSearchBar(),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppTable(_employees),
            ),
          ),
        ],
      ),
    );
  }
}
