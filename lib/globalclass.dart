import 'package:flutter/material.dart';

class GlobalData {
  static List<String> history = [];
}

class LoginApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPages(),
    );
  }
}

class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedRole = 'User';
  String _username = '';
  String _password = '';

  void _login() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      // Replace this section with actual authentication logic.

      // Simulated authentication for demonstration purposes.
      bool isAuthenticated = (_username == 'demo' && _password == 'password');

      if (isAuthenticated) {
        // Update the global history list when the user logs in.
        // Add your code to fetch the current history list here.
        GlobalData.history = [
          // ... (your existing code to fetch the current history list)
        ];

        // Navigate to the HistoryPage with the updated history list.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HistoryPage(history: GlobalData.history),
          ),
        );
      } else {
        // Show an alert if authentication fails.
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Authentication Failed'),
              content: Text('Please check your username and password.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the alert.
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ... (your existing code)

                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // The history list is now updated in real-time when the user logs in.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HistoryPage(history: GlobalData.history),
                      ),
                    );
                  },
                  child: Text('Track Complaint'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  HistoryPage({required List<String> history}) {}
}
