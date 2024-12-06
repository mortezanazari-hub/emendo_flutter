import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:flutter/material.dart';

class SendUsMessageScreen extends StatefulWidget {
  const SendUsMessageScreen({super.key});

  @override
  State<SendUsMessageScreen> createState() => _SendUsMessageScreen();
}

class _SendUsMessageScreen extends State<SendUsMessageScreen> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Column(
          children: [
            MyStyleTextFormField(
              labelText: "Subject",
              controller: subjectController,
            ),
            SizedBox(height: 10),
            MyStyleTextFormField(
              controller: messageController,
              keyboardType: TextInputType.multiline,
              maxLength: 500,
              labelText: "Message",
              maxLines: 4,
            ),
            SizedBox(height: 10),
            AppButton(text: "send", onPressed: () {})
          ],
        )),
      ),
    );
  }
}
