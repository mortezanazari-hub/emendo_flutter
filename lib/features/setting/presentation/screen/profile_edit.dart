import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.color0,
      appBar: AppBar(
        backgroundColor: AppConst.color0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Text('Profile Edit Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save the profile changes and navigate back to the profile screen
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
