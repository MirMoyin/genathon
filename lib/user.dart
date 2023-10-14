import 'package:advbasics/main.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'userhistory.dart';

class UserHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Complaint Registration',
      theme: ThemeData(
        primaryColor: Colors.green, // Change the color of the AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
        ),
      ),
      home: UserHomePag(),
    );
  }
}

class UserHomePag extends StatefulWidget {
  @override
  _UserHomePagState createState() => _UserHomePagState();
}

class _UserHomePagState extends State<UserHomePag> {
  List<String>? _fileNames;
  TextEditingController _complaintController = TextEditingController();
  List<String> _history = [];
  List<String> dropdownItems = List.generate(8, (index) => "Item $index");
  String selectedDropdownItem = "Item 1"; // Default value
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Colors.greenAccent,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Complaint Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserHomePage(),
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Write your complaint:',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFDCDF8B),
                ),
              ),
              DropdownButton<String>(
          value: selectedDropdownItem,
          onChanged: (String? newValue) {
            setState(() {
              selectedDropdownItem = newValue!;
            });
          },
          items: dropdownItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
              SizedBox(height: 10),
              TextField(
                controller: _complaintController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Color.fromARGB(255, 245, 245, 209),
                  filled: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickFiles,
                child: Text("Pick Files"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Change the button color to green
                ),
              ),
              SizedBox(height: 10),
              if (_fileNames != null)
                Text("Selected Files: ${_fileNames!.join(', ')}"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitFiles,
                child: Text("Submit Complaint"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Change the button color to green
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the HistoryPage and pass the history data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(history: _history),
                    ),
                  );
                },
                child: Text("View History"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Change the button color to green
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your logout logic here
                  // For example, you can clear user authentication data, navigate to the login page, etc.
                  // After logging the user out, navigate to the login page:
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginApp(),
                    ),
                    (route) =>
                        false, // This removes all the previous routes from the stack
                  );
                },
                child: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 235, 33, 33), // Change the button color to red
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'mp4', 'mp3'],
    );

    if (result != null) {
      List<String> fileNames = result.files.map((file) => file.name).toList();

      setState(() {
        _fileNames = fileNames;
      });
    } else {
      // Handle if no file is picked.
    }
  }

  Future<void> _submitFiles() async {
    if (_fileNames != null) {
      String complaintText = _complaintController.text;

      // Add the complaint text and selected files to the history
      _history.add(
          'Complaint Text: $complaintText, Selected Files: ${_fileNames!.join(', ')}');

      // Clear the complaint text and selected files
      _complaintController.clear();
      setState(() {
        _fileNames = null;
      });

      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Submission Result'),
            content: Text('Your complaint is submitted'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _complaintController.dispose();
    super.dispose();
  }
}
