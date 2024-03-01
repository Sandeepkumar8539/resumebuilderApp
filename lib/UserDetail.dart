import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resumebuilderapp/DataModel/Model.dart';
import 'package:resumebuilderapp/HomePage.dart';
import 'package:resumebuilderapp/Update.dart';


class UserDetail extends StatefulWidget {
  UserDetail({Key? key}) : super(key: key);

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _positionalController = TextEditingController();
  final TextEditingController _companycontroller = TextEditingController();
  final TextEditingController _intermidiateController = TextEditingController();
  final TextEditingController _skillController = TextEditingController();
  final TextEditingController _programinglanguage = TextEditingController();
  final TextEditingController _currentlocation = TextEditingController();
  final TextEditingController _university = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: ListView(
       children: [
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             children: [
               TextFormField(
                 controller: _nameController,
                 decoration: InputDecoration(
                   hintText: 'Name',
                 ),
               ),
               TextFormField(
                 controller: _emailController,
                 decoration: InputDecoration(
                   hintText: 'Email',
                 ),
               ),
               TextFormField(
                 controller: _mobileController,
                 decoration: InputDecoration(
                   hintText: 'Mobile',
                 ),
               ),
               TextFormField(
                 controller: _positionalController,
                 decoration: InputDecoration(
                   hintText: 'Position',
                 ),
               ),
               TextFormField(
                 controller: _companycontroller,
                 decoration: InputDecoration(
                   hintText: 'Company',
                 ),
               ),
               TextFormField(
                 controller: _intermidiateController,
                 decoration: InputDecoration(
                   hintText: 'Intermidiate',
                 ),
               ),
               TextFormField(
                 controller: _skillController,
                 decoration: InputDecoration(
                   hintText: 'Skills',
                 ),
               ),
               TextFormField(
                 controller: _currentlocation,
                 decoration: InputDecoration(
                   hintText: 'Current Location',
                 ),
               ),
               TextFormField(
                 controller: _university,
                 decoration: InputDecoration(
                   hintText: 'University',
                 ),
               ),
               TextFormField(
                 controller: _programinglanguage,
                 decoration: InputDecoration(
                   hintText: 'Programing Language',
                 ),
               ),
               ElevatedButton(
                 onPressed: () {
                   final userData = UserData(
                     id: _db.collection('users').doc().id,
                     name: _nameController.text.trim(),
                     email: _emailController.text.trim(),
                     phone: _mobileController.text.trim(),
                     position: _positionalController.text.trim(),
                     skill: _skillController.text.trim(),
                     company: _companycontroller.text.trim(),
                     intermidiate: _intermidiateController.text.trim(),
                     currentLocation: _currentlocation.text.trim(),
                     university: _university.text.trim(),
                     programingLanguage: _programinglanguage.text.trim(),
                   );
                   _insertData(userData);
                 },
                 child: Text('Save'),
               ),
             ],
           ),
         ),
       ],
      )
    );
  }

  Future<void> _insertData(UserData userData) async {
    try {
      await _db.collection('users').doc(userData.id).set({
        'name': userData.name,
        'email': userData.email,
        'phone': userData.phone,
        'position': userData.position,
        'skill': userData.skill,
        'company': userData.company,
        'intermidiate': userData.intermidiate,
        'location': userData.currentLocation,
        'university': userData.university,
        'programinglanguage': userData.programingLanguage,
      });
      print('Data inserted successfully');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResumeScreen(userData: userData,)),
      );
    } catch (e) {
      print('Error inserting data: $e');
    }
  }
}


