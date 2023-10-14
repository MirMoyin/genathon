import 'package:flutter/material.dart';

class AdminComplaintReceived extends StatefulWidget {
  @override
  _AdminComplaintReceivedState createState() => _AdminComplaintReceivedState();
}

class _AdminComplaintReceivedState extends State<AdminComplaintReceived> {
  List<String> complaints = [];
  List<String> solvedComplaints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Received'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: complaints.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(complaints[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      // Mark the complaint as solved and move it to the solved list.
                      markComplaintAsSolved(index);
                    },
                  ),
                );
              },
            ),
          ),
          Divider(),
          Text('Complaints Solved: ${solvedComplaints.length}'),
          Text(
              'Complaints Remaining: ${complaints.length - solvedComplaints.length}'),
        ],
      ),
    );
  }

  void markComplaintAsSolved(int index) {
    setState(() {
      String complaint = complaints[index];
      complaints.removeAt(index);
      solvedComplaints.add(complaint);
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: AdminComplaintReceived(),
  ));
}
