import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resumebuilderapp/Update.dart';

class ResumeScreen extends StatefulWidget {
  final UserData userData;

  ResumeScreen({required this.userData});

  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  late UserData _userData;

  @override
  void initState() {
    super.initState();
    _userData = widget.userData; // Initialize with provided userData
  }

  Future<void> deleteUserData(String userId) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).delete();
      print('User data deleted successfully');
      setState(() {
        _userData = UserData(id: '', name: '', email: '', phone: '', position: '', skill: '', company: '', intermidiate: '', currentLocation: '', university: '', programingLanguage: ''); // Clear userData in the state
      });
    } catch (e) {
      print('Error deleting user data: $e');
    }
  }

  void _updateUserData(UserData updatedData) {
    setState(() {
      _userData = updatedData; // Update userData in the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Resume'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Name: ${_userData.name}'),
              subtitle: Text('Email: ${_userData.email}', style: TextStyle(fontSize: 12)),
              leading: Icon(Icons.person),
            ),
            Divider(),
            Text(
              'Education',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('University: ${_userData.university}'),
              subtitle: Text('Position: ${_userData.position}'),
              leading: Icon(Icons.school),
            ),
            Divider(),
            Text(
              'Work Experience',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Company: ${_userData.company}'),
              subtitle: Text('Current Location: ${_userData.currentLocation}'),
              leading: Icon(Icons.work),
            ),
            Divider(),
            Text(
              'Skills',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Skills: ${_userData.skill}'),
              leading: Icon(Icons.code),
            ),
            Divider(),
            Text(
              'Contact',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Phone: ${_userData.phone}'),
              subtitle: Text('Location: ${_userData.currentLocation}'),
              leading: Icon(Icons.contact_phone),
            ),
            // Display other userData fields similarly
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(userData: _userData),)).then((updatedData) {
                      if (updatedData != null) {
                        _updateUserData(updatedData);
                      }
                    });
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await deleteUserData(_userData.id);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
