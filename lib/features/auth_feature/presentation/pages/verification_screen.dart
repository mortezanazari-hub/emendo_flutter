import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/auth_feature/presentation/widgets/result_icon.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verification_Screen extends StatefulWidget {
  const Verification_Screen({super.key});

  @override
  State<Verification_Screen> createState() => _Verification_ScreenState();
}

class _Verification_ScreenState extends State<Verification_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(onTap: () {}, child: const Icon(Icons.arrow_back)),

        //titleSpacing: AppConst.screenWidth * 0.1,
        title: const Text(
          "Verification",
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: AppConst.standardPadding),
          Row(
            children: [
              Spacer(),
              ResultIcon(
                color: AppConst.mainColor,
                size: AppConst.screenWidth * 0.33,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
