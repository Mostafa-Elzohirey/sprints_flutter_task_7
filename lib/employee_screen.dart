import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sprints_flutter_task_7/employee.dart';
import 'package:sprints_flutter_task_7/shared.dart';

import 'employee_details.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  List<Employee> employees = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getEmployeeFromCached();
    getEmployees();
  }

  void getEmployees() async {
    try {
      var response = await Dio()
          .get("https://mocki.io/v1/283ba093-9bf9-42e4-8f28-d2538937f9ca");
      var data = response.data;
      var cachedData = jsonEncode(data);
      Prefs.setString(PrefKeys.employees, cachedData);
      data.forEach(
        (emp) {
          Employee employee = Employee.fromJson(emp);
          employees.add(employee);
        },
      );
      isLoading = false;
      setState(() {});
    } on Exception catch (e) {
      setState(() {
        print(e.toString());
      });
    }
  }

  getEmployeeFromCached() async {
    try {
      String data = Prefs.getString(PrefKeys.employees);
      var jsonData = jsonDecode(data);
      jsonData.forEach((emp) {
        Employee employee = Employee.fromJson(emp);
        employees.add(employee);
      });
      isLoading = false;
      setState(() {});
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employees"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return InkWell(
                    onTap: () {
                      navToDetails(employee);
                    },
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text("${employee.id}"),
                                // SizedBox(
                                //   width: 15,
                                // ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Full name: ${employee.firstName} ${employee.lastName}"),
                                      Text("Salary: ${employee.salary}5000"),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.person)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                }),
      ),
    );
  }

  navToDetails(Employee employee) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmployeeDetailsScreen(employee: employee),
        ));
  }

  showSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
