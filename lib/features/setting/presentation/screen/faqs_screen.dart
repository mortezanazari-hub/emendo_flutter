import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/features/setting/data/local/fake_faq_db.dart';
import 'package:emendo/features/setting/data/model/faq_model.dart';
import 'package:emendo/features/setting/presentation/widget/faq_item_widget.dart';
import 'package:flutter/material.dart';

class FaqsScreen extends StatefulWidget {
  FaqsScreen({super.key});

  final List<FaqModel> faqList = FakeFaqDb.faqDb;

  @override
  State<FaqsScreen> createState() => _FaqsScreen();
}

class _FaqsScreen extends State<FaqsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.color0,
      appBar: AppBar(
        surfaceTintColor: AppConst.color0,
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
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "We're here to answer all your questions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppConst.color7,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "If you are new to Emendo and have questions about how it works, we have put together a list of frequently asked questions for you. You can also use the Contact Us section for questions that are not listed here.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: AppConst.color5,
                ),
              ),
              ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.faqList.length,
                itemBuilder: (context, index) {
                  return FaqItem(
                    question: widget.faqList[index].question,
                    answer: widget.faqList[index].answer,
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                "Can't find your question? \n Please ask us!'",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppConst.color5,
                ),
              ),
              SizedBox(height: 10),
              AppButton(text: "Ask us", onPressed: () {}),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
