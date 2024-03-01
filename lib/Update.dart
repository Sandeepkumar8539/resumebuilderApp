import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resumebuilderapp/HomePage.dart';

class UserData {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String position;
  final String skill;
  final String company;
  final String intermidiate;
  final String currentLocation;
  final String university;
  final String programingLanguage;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.position,
    required this.skill,
    required this.company,
    required this.intermidiate,
    required this.currentLocation,
    required this.university,
    required this.programingLanguage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'email': email,
      'phone': phone,
      'position': position,
      'skill': skill,
      'company': company,
      'intermidiate': intermidiate,
      'currentLocation': currentLocation,
      'university': university,
      'programingLanguage': programingLanguage,
    };
  }
}

class UpdatePage extends StatefulWidget {
  final UserData userData;

  const UpdatePage({Key? key, required this.userData}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController updatenameController = TextEditingController();
  TextEditingController updateemailController = TextEditingController();
  TextEditingController updatephoneController = TextEditingController();
  TextEditingController updatepositionController = TextEditingController();
  TextEditingController updatecompanyController = TextEditingController();
  TextEditingController updateintermidiateController = TextEditingController();
  TextEditingController updateskillsController = TextEditingController();
  TextEditingController updatecurrentlocationController = TextEditingController();
  TextEditingController updateuniversityController = TextEditingController();
  TextEditingController updateprogramingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updatenameController.text = widget.userData.name;
    updateemailController.text = widget.userData.email;
    updatephoneController.text = widget.userData.phone;
    updatepositionController.text = widget.userData.position;
    updatecompanyController.text = widget.userData.company;
    updateintermidiateController.text = widget.userData.intermidiate;
    updateskillsController.text = widget.userData.skill;
    updatecurrentlocationController.text = widget.userData.currentLocation;
    updateuniversityController.text = widget.userData.university;
    updateprogramingController.text = widget.userData.programingLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: updatenameController,
              decoration: InputDecoration(hintText: 'Name'),
            ),
            TextFormField(
              controller: updateemailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            TextFormField(
              controller: updatephoneController,
              decoration: InputDecoration(hintText: 'Phone'),
            ),
            TextFormField(
              controller: updatepositionController,
              decoration: InputDecoration(hintText: 'Position'),
            ),
            TextFormField(
              controller: updatecompanyController,
              decoration: InputDecoration(hintText: 'Company'),
            ),
            TextFormField(
              controller: updateintermidiateController,
              decoration: InputDecoration(hintText: 'Intermediate'),
            ),
            TextFormField(
              controller: updateskillsController,
              decoration: InputDecoration(hintText: 'Skills'),
            ),
            TextFormField(
              controller: updatecurrentlocationController,
              decoration: InputDecoration(hintText: 'Current Location'),
            ),
            TextFormField(
              controller: updateuniversityController,
              decoration: InputDecoration(hintText: 'University'),
            ),
            TextFormField(
              controller: updateprogramingController,
              decoration: InputDecoration(hintText: 'Programming'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                UserData updatedData = UserData(
                  id: widget.userData.id,
                  name: updatenameController.text,
                  email: updateemailController.text,
                  phone: updatephoneController.text,
                  position: updatepositionController.text,
                  company: updatecompanyController.text,
                  intermidiate: updateintermidiateController.text,
                  skill: updateskillsController.text,
                  currentLocation: updatecurrentlocationController.text,
                  university: updateuniversityController.text,
                  programingLanguage: updateprogramingController.text,
                );

                try {
                  await FirebaseFirestore.instance.collection('users').doc(updatedData.id).update(updatedData.toMap());
                  print('Data updated successfully');

                  // Close the update page and pass the updated data back to the ResumeScreen
                  Navigator.pop(context, updatedData);
                } catch (e) {
                  print('Error updating data: $e');
                  // Display error message to the user
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error updating data. Please try again.')),
                  );
                }
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
