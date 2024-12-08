import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/setting/data/local/fake_faq_db.dart';
import 'package:emendo/features/setting/data/model/faq_model.dart';
import 'package:emendo/features/setting/presentation/screen/setting_screen.dart';
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
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

class _FaqItemState extends State<FaqItem> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool showAnswer = false;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -0.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void toggleAnswer() {
    setState(() {
      showAnswer = !showAnswer;
      if (showAnswer) {
        _slideController.forward();
        _fadeController.forward();
      } else {
        _slideController.reverse();
        _fadeController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.question,
                      maxLines: 10,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppConst.color6,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: toggleAnswer,
                  child: Icon(
                    !showAnswer ? Icons.add : Icons.remove,
                    color: AppConst.color6,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            showAnswer
                ? FadeTransition(
                    opacity: _fadeAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.answer,
                          style: TextStyle(color: AppConst.color5),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
