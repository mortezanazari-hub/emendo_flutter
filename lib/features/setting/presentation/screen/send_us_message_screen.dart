import 'package:emendo/core/utils/app_const.dart';
import 'package:flutter/material.dart';

class SendUsMessageScreen extends StatefulWidget {
  const SendUsMessageScreen({super.key});

  @override
  State<SendUsMessageScreen> createState() => _SendUsMessageScreen();
}

class _SendUsMessageScreen extends State<SendUsMessageScreen> {
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
        title: Text('Send a message to us'),
      ),
      body: Center(
        child: Text('send Screen'),
      ),
    );
  }
}
