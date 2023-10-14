import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> history;

  HistoryPage({required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page'),
      ),
      body: ComplaintHistoryList(history: history),
    );
  }
}

class ComplaintHistoryList extends StatefulWidget {
  final List<String> history;

  ComplaintHistoryList({required this.history});

  @override
  _ComplaintHistoryListState createState() => _ComplaintHistoryListState();
}

class _ComplaintHistoryListState extends State<ComplaintHistoryList> {
  String searchResult = '';
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search by 10-digit Complaint Number',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            searchComplaint(_searchController.text);
          },
          child: Text('Search'),
        ),
        Text(searchResult, style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: widget.history.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(widget.history[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  void searchComplaint(String complaintNumber) {
    for (String entry in widget.history) {
      if (entry.contains(complaintNumber)) {
        setState(() {
          searchResult = 'Complaint $complaintNumber - In Progress';
        });
        return;
      }
    }
    setState(() {
      searchResult = 'Complaint $complaintNumber - Not Found';
    });
  }
}
