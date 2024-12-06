import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool _showAvatarEdit = false;

  ///fake user data
  final String _nameOfUser = "Morteza";
  final String _lastNameOfUser = "Nazari";
  final String _emailOfUser = "namo352@gmail.com";
  final bool _userIsActive = false;

  ///field controller
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _lastNameFieldController =
      TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _currentPassFieldController =
      TextEditingController();
  final TextEditingController _newPassFieldController = TextEditingController();
  final TextEditingController _newRePassFieldController =
      TextEditingController();

  @override
  void initState() {
    _nameFieldController.text = _nameOfUser;
    _lastNameFieldController.text = _lastNameOfUser;
    _emailFieldController.text = _emailOfUser;
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppConst.color3),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink(
                        padding: EdgeInsets.all(5),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(70),
                          onTap: () {
                            setState(() {
                              _showAvatarEdit = !_showAvatarEdit;
                            });
                          },
                          child: CircleAvatar(
                            radius: 70,
                            foregroundImage: AssetImage(
                                "lib/core/resources/png/default_avatar.png"),
                          ),
                        ),
                      ),
                      if (_showAvatarEdit)
                        Positioned(
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              print("edit avatar clicked");
                            },
                            child: Container(
                                color: Color(0xA0000000),
                                height: 30,
                                width: 150,
                                child: Icon(
                                  Icons.image,
                                  color: AppConst.color2,
                                )),
                          ),
                        )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                MyStyleTextFormField(
                  controller: _nameFieldController,
                  labelText: "Name",
                  hintText: "Name",
                  //initialValue: _nameOfUser,
                ),
                SizedBox(height: 10),
                MyStyleTextFormField(
                  controller: _lastNameFieldController,
                  labelText: "Last Name",
                  hintText: "Last Name",
                  // initialValue: _lastNameOfUser,
                ),
                SizedBox(height: 10),
                Stack(
                  children: [
                    MyStyleTextFormField(
                      controller: _emailFieldController,
                      readOnly: true,
                      labelText: "Email Address",
                      hintText: "Email Address",
                      // initialValue: _emailOfUser,
                    ),
                    if (!_userIsActive)
                      Positioned(
                        right: 10,
                        top: 16,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Not Active",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "if you want to change password, fill bottom field",
                  style: TextStyle(color: AppConst.color5),
                ),
                SizedBox(height: 10),
                MyStyleTextFormField(
                  controller: _currentPassFieldController,
                  labelText: "Current Password",
                  hintText: "Current Password",
                  obscureText: true,
                ),
                SizedBox(height: 10),
                MyStyleTextFormField(
                  controller: _newPassFieldController,
                  labelText: "New Password",
                  hintText: "New Password",
                  obscureText: true,
                ),
                SizedBox(height: 10),
                MyStyleTextFormField(
                  controller: _newRePassFieldController,
                  labelText: "Retype New Password",
                  hintText: "Retype New Password",
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
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
