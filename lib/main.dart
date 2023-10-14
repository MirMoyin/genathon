import 'package:advbasics/chatbot.dart';
import 'package:flutter/material.dart';
import 'complaint.dart';
import 'admin.dart';
import 'user.dart';
import 'globalclass.dart';
import 'forgetpassword.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _selectedRole = 'User';
  String _username = '';
  String _password = '';

  void _login() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      // Perform authentication here based on _selectedRole, _username, and _password.
      // In a real app, you would replace the print statements with actual authentication logic.

      // Simulated authentication for demonstration purposes.
      bool isAuthenticated = (_username == 'demo' && _password == 'password');

      if (isAuthenticated) {
        // Navigate to the appropriate page based on the selected role.
        if (_selectedRole == 'User') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserHomePage(),
            ),
          );
        } else if (_selectedRole == 'Admin') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminDashboard(),
            ),
          );
        }
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

//
//
//
  void _goToForgetPasswordPage() {
    // Navigate to the ForgetPasswordPage when the "Forget Password" button is pressed.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgetPasswordPage(),
      ),
    );
  }
//
//
//

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
          title: Center(
            // Center-align the title text
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 30, // Increase the font size to 24
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // drop down menu
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      onChanged: (value) {
                        setState(
                          () {
                            _selectedRole = value!;
                          },
                        );
                      },
                      items: ['User', 'Admin'].map((role) {
                        return DropdownMenuItem<String>(
                          value: role,
                          child: Container(
                            // Wrap the Text with a Container
                            // color:
                            //     Colors.transparent, // Set the background color
                            child: Text(
                              role,
                              style: TextStyle(
                                color: Color(0xFFDCDF8B),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      elevation:
                          4, // Change the elevation to control the shadow
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 30, // Set the size of the icon
                        color: Color(0xFFDCDF8B),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'User-ID',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            color: Color(0xFFDCDF8B),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _username = value;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Color(0xFFDCDF8B),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _password = value;
                      },
                    ),

                    ///
                    ///
                    ///
                    if (_selectedRole == 'User')
                      Align(
                        alignment: Alignment(1, 4),
                        child: TextButton(
                          onPressed: _goToForgetPasswordPage,
                          child: Text(
                            'Forget Password',
                            style: TextStyle(color: Color(0xFFDCDF8B)),
                          ),
                        ),
                      ),

                    ///
                    ///
                    ///
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment(0, 0),
                      child: ElevatedButton(
                        onPressed: _login,
                        child: Text('Login'),
                      ),
                    ),

                    // text button of forgetpassword

                    SizedBox(height: 20),
                    SingleChildScrollView(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the ComplaintApp page when the "Track Complaint" button is pressed.
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
                    ),

                    SizedBox(height: 20),
                    SingleChildScrollView(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the HistoryPage when the "Chatbot" button is pressed.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatGPTScreen()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons
                                .chat_bubble), // You can choose a different chat bot icon
                            SizedBox(
                                width:
                                    8), // Add some spacing between the icon and text
                            Text('Chatbot'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
//
//
//
//



