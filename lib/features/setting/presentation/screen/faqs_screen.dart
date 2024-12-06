import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/setting/presentation/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreen();
}

class _FaqsScreen extends State<FaqsScreen> {
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
        title: Text('FAQs '),
      ),
      body: SingleChildScrollView(
        child: SectionBox(padding: EdgeInsets.all(10), children: [
          FaqItem(
            question: "is Emendo is free?",
            answer:
                "In general, Emendo can be used for free, but the free version has limitations that you can remove for a very fair price and also help the developers to develop the software further.",
          )
        ]),
      ),
    );
  }
}

class FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<FaqItem> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Ink(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppConst.color3),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        widget.question,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          showAnswer = !showAnswer;
                        });
                      },
                      child: Icon(
                        !showAnswer ? Icons.add : Icons.remove,
                      ),
                    ),
                    SizedBox(width: 10)
                  ],
                ),
                if (showAnswer)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.answer,
                      style: TextStyle(color: AppConst.color5),
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
