import 'package:emendo/features/setting/data/model/faq_model.dart';

class FakeFaqDb {
  static List<FaqModel> faqDb = [
    FaqModel(
      question: "Is Emendo free to use?",
      answer:
          "In the past, Emendo was available for free, but the free version had limitations that you could remove for a fair price and also help the developers to continue developing the software.",
    ),
    FaqModel(
      question: "How can I secure my user account?",
      answer: "To secure your user account, you should follow these steps: ...",
    ),
    FaqModel(
      question: "What is the support team's contact information?",
      answer:
          "You can reach out to our support team at support@emendo.com or by calling 1-800-EMENDO.",
    ),
    FaqModel(
      question: "How can I update my software?",
      answer:
          "To update your software, go to the 'Settings' section and click on 'Check for Updates'.",
    ),
    FaqModel(
      question: "Can I export my data?",
      answer:
          "Yes, you can export your data by going to the 'Settings' section and clicking on 'Export Data'.",
    ),
    FaqModel(
      question: "How can I delete my account?",
      answer:
          "To delete your account, go to the 'Settings' section and click on 'Delete Account'. Please note that this action cannot be undone.",
    ),
    FaqModel(
      question: "What is the privacy policy?",
      answer:
          "You can find our privacy policy at https://emendo.com/privacy-policy.",
    ),
    FaqModel(
      question: "How can I report a bug or issue?",
      answer:
          "To report a bug or issue, please email us at support@emendo.com or fill out the 'Contact Us' form in the app.",
    ),
    FaqModel(
      question: "How can I get help with a specific feature?",
      answer:
          "To get help with a specific feature, go to the 'Help' section and search for the feature you're interested in.",
    ),
    FaqModel(
      question: "What is the warranty period for Emendo?",
      answer:
          "Emendo has a one-year warranty for the software and hardware components.",
    ),
  ];
}
