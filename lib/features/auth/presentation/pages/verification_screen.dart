import 'package:emendo/config/shared_oprator.dart';
import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/app_button.dart';
import 'package:emendo/core/widgets/app_link_text.dart';
import 'package:emendo/di.dart';
import 'package:emendo/features/auth/domain/entities/verify_email_entity.dart';
import 'package:emendo/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:emendo/features/auth/presentation/pages/register_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/register_success_modal.dart';
import '../widgets/result_icon.dart';

class Verification_Screen extends StatefulWidget {
  Verification_Screen({super.key,required this.token});

  String token;
  @override
  State<Verification_Screen> createState() => _Verification_ScreenState();
}

class _Verification_ScreenState extends State<Verification_Screen> {
  late AuthBloc bloc;
  late TextEditingController verificationCode;
  @override
  void initState() {
    super.initState();
    bloc = AuthBloc();
    verificationCode = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
    verificationCode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const RegisterScreen(),
              ));
            },
            child: const Icon(Icons.arrow_back)),

        //titleSpacing: AppConst.screenWidth * 0.1,
        title: const Text(
          "Verification",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppConst.standardPadding * 3),
            Row(
              children: [
                const Spacer(),
                ResultIcon(
                  icon: Icons.mail_lock,
                  color: AppConst.mainColor,
                  size: AppConst.screenWidth * 0.33,
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: AppConst.standardPadding),
            Text(
              "Verification Code",
              style: TextStyle(
                fontSize: AppConst.standardTitleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "We have to sent the code to verification",
              style: TextStyle(
                fontSize: AppConst.standardDescriptionFontSize,
                color: AppConst.disabledColor,
              ),
            ),
            SizedBox(height: AppConst.standardPadding * 0.5),
            Text(
              "namo352@gmail.com",
              style: TextStyle(
                  fontSize: AppConst.standardDescriptionFontSize,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: AppConst.standardPadding,
            ),
            SizedBox(
              width: AppConst.screenWidth * .6,
              child: PinCodeTextField(
                controller: verificationCode,
                appContext: context,
                length: 5,
                keyboardType: TextInputType.number,
                backgroundColor: Colors.white,
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(15),
                  fieldHeight: AppConst.standardButtonHeight * 1.1,
                  fieldWidth: AppConst.standardButtonHeight * .9,
                  activeBorderWidth: 0,
                  activeColor: AppConst.mainColor,
                  //borderWidth: 1.5,
                  disabledBorderWidth: 0,
                  inactiveBorderWidth: 0,
                  selectedBorderWidth: 1.5,
                  disabledColor: AppConst.disabledColor,
                  inactiveColor: AppConst.disabledColor,
                  selectedColor: AppConst.mainColor,
                  shape: PinCodeFieldShape.box,
                ),
              ),
            ),
            SizedBox(height: AppConst.standardPadding),
            BlocConsumer(
              bloc: bloc,
              buildWhen: (previous, current) => current is ValidationEmailLoading || current is ValidationEmailSuccess || current is ValidationEmailFailed,
              listenWhen: (previous, current) => current is ValidationEmailLoading || current is ValidationEmailSuccess || current is ValidationEmailFailed,
              listener: (context, state) {
                if(state is ValidationEmailFailed){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)
                      )
                  );
                }
                if(state is ValidationEmailSuccess){
                  locator<SharedPrefOperator>().setUserToken(widget.token);
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      useSafeArea: true,
                      constraints: BoxConstraints(
                        maxHeight: AppConst.screenHeight * .7,
                        minHeight: 295,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppConst.standardPadding)),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return const RegisterSuccessModal();
                      });
                }
              },
              builder: (context,state){
                if(state is ValidationEmailLoading){
                  return Center(child: CircularProgressIndicator());
                }
                return AppButton(
                    text: "Submit",
                    onPressed: () {
                      bloc.add(
                        ValidationEmailEvent(code: verificationCode.text)
                      );
                    });
              },
            ),
            SizedBox(height: AppConst.standardPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the code? "),
                AppLinkText(text: "Resend", onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
