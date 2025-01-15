import 'package:flutter/material.dart';

import 'employee.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  const EmployeeDetailsScreen({super.key, required this.employee});
  final Employee employee;
  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.employee.firstName} ${widget.employee.lastName}"),
        centerTitle: true,
      ),
      body: Center(
        child: Expanded(
          child: Container(
            
            margin: EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 5,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text("${widget.employee.id}"),
          
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Full name: ${widget.employee.firstName} ${widget.employee.lastName}"),
                        Text("Age: ${widget.employee.age}"),
                        Text("E-mail: \n${widget.employee.email}"),
                        Text("Contact Number: ${widget.employee.contactNumber}"),
                        Text("Salary: ${widget.employee.salary}5000"),
                        Text("Date of Birth: ${widget.employee.dob}"),
                        Text("Address: ${widget.employee.address}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
