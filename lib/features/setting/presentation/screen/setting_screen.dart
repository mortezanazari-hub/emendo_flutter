import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/my_style_dropdown_button_form_field.dart';
import 'package:emendo/core/widgets/my_style_switch.dart';
import 'package:emendo/core/widgets/my_style_text_form_field.dart';
import 'package:emendo/features/setting/presentation/screen/about_us_screen.dart';
import 'package:emendo/features/setting/presentation/screen/faqs_screen.dart';
import 'package:emendo/features/setting/presentation/screen/profile_edit.dart';
import 'package:emendo/features/setting/presentation/screen/send_us_message_screen.dart';
import 'package:emendo/features/setting/presentation/screen/upgrade_screen.dart';
import 'package:emendo/features/tasks/data/model/task_model.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  /// Display Boolean
  bool _displayAppearanceOptions = false;
  bool _displaySecurityOptions = false;
  bool _displayNotificationOptions = false;

  ///fake data of user model
  final _name = "Morteza Nazari";
  final _email = "namo352@gmail.com";
  final _verified = false;
  final _avatarAddress = "lib/core/resources/png/default_avatar.png";
  final isPro = true;

  ///fake setting options
  bool usePasscode = false;
  String passcode = "";
  bool isDarkMode = false;
  NotificationType notificationTypeSelected = NotificationType.push;

  String languageSelected = AppConst.languageOptions[0];
  String colorSchemeSelected = AppConst.colorSchemeOptions[0];
  String fontSelected = AppConst.fontSelectOptions[0];
  TextEditingController passCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.color0,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ///Profile Box
                SectionBox(children: [
                  SizedBox(height: 10),
                  SettingRow(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileEditScreen(),
                          ),
                        );
                      },
                      middleWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///User Name
                          Text(
                            _name,
                            style: TextStyle(
                                color: AppConst.color7,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Row(
                            children: [
                              /// email address
                              Text(
                                _email,
                                style: TextStyle(
                                    color: AppConst.color7,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10),
                              ),

                              ///Active or Not Active
                              Text(
                                !_verified
                                    ? " (Not activated)"
                                    : " (Activated)",
                                style: TextStyle(
                                  color:
                                      !_verified ? Colors.red : AppConst.color4,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      setIcon: CircleAvatar(
                        foregroundImage: AssetImage(_avatarAddress),
                        radius: 16,
                      ),
                      endWidget: EndSettingRowWidget()),

                  ///subscription row
                  SettingRow(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UpgradeScreen(),
                        ),
                      );
                    },
                    middleWidget: _textOfPro(),
                    setIcon: SetIcon(icon: Icons.attach_money),
                    endWidget: EndSettingRowWidget(),
                  ),

                  SizedBox(height: 10),
                ]),

                SizedBox(height: 10),

                ///quick appearance
                SectionBox(
                  children: <Widget>[
                    // #endregion
                  ],
                ),
                SizedBox(height: 10),

                /// Rollable Settings
                SectionBox(
                  children: [
                    SizedBox(height: 10),

                    ///Appearance row
                    SettingRow(
                      middleWidget: AppSettingTitleText("Appearance"),
                      setIcon: SetIcon(icon: Icons.color_lens),
                      endWidget: EndSettingRowWidget(
                        icon: _displayAppearanceOptions == false
                            ? Icons.chevron_right
                            : Icons.keyboard_arrow_down,
                        onTapArrow: () {
                          setState(() {
                            _displayAppearanceOptions =
                                !_displayAppearanceOptions;
                          });
                        },
                      ),
                    ),
                    if (_displayAppearanceOptions)
                      SectionBox(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          SizedBox(height: 10),

                          ///Dark Mode
                          SettingRow(
                            middleWidget: AppSettingTitleText("Dark Mode"),
                            setIcon: SetIcon(icon: Icons.dark_mode),
                            endWidget: MyStyleSwitch(
                              value: isDarkMode,
                              onChanged: (val) {
                                setState(() {
                                  isDarkMode = val;
                                });
                              },
                            ),
                          ),

                          /// Language Select
                          SettingRow(
                            middleWidget: AppSettingTitleText("Language"),
                            setIcon: SetIcon(icon: Icons.language),
                            endWidget: SizedBox(
                              width: 120,
                              child: MyStyleDropdownButtonFormField(
                                isDense: true,
                                value: languageSelected,
                                onChanged: (val) {
                                  if (languageSelected != val) {
                                    setState(() {
                                      languageSelected = val!;
                                    });
                                  }
                                },
                                items: AppConst.languageOptions,
                              ),
                            ),
                          ),

                          /// ColorScheme Select
                          SettingRow(
                            middleWidget: AppSettingTitleText("Color Scheme"),
                            setIcon: SetIcon(icon: Icons.format_paint),
                            endWidget: SizedBox(
                              width: 120,
                              child: MyStyleDropdownButtonFormField(
                                // isDense: false,
                                value: colorSchemeSelected,
                                onChanged: (val) {
                                  if (colorSchemeSelected != val) {
                                    setState(() {
                                      colorSchemeSelected = val!;
                                    });
                                  }
                                },
                                items: AppConst.colorSchemeOptions,
                              ),
                            ),
                          ),

                          /// Font Select
                          SettingRow(
                            middleWidget: AppSettingTitleText("Font Select"),
                            setIcon: SetIcon(icon: Icons.font_download),
                            endWidget: SizedBox(
                              width: 140,
                              child: MyStyleDropdownButtonFormField(
                                // isDense: false,
                                value: fontSelected,
                                onChanged: (val) {
                                  if (fontSelected != val) {
                                    setState(() {
                                      fontSelected = val!;
                                    });
                                  }
                                },
                                items: AppConst.fontSelectOptions,
                              ),
                            ),
                          ),

                          /// Font size
                          SettingRow(
                            middleWidget: AppSettingTitleText("Font Select"),
                            setIcon: SetIcon(icon: Icons.format_size),
                            endWidget: SizedBox(
                              width: 140,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      setState(() {
                                        AppConst.plusFontSize++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 25,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      setState(() {
                                        AppConst.plusFontSize--;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 10),
                        ],
                      ),

                    ///Security row
                    SettingRow(
                      middleWidget: AppSettingTitleText("Security"),
                      setIcon: SetIcon(icon: Icons.security),
                      endWidget: EndSettingRowWidget(
                        icon: _displaySecurityOptions == false
                            ? Icons.chevron_right
                            : Icons.keyboard_arrow_down,
                        onTapArrow: () {
                          setState(() {
                            _displaySecurityOptions = !_displaySecurityOptions;
                          });
                        },
                      ),
                    ),
                    if (_displaySecurityOptions)
                      SectionBox(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          SizedBox(height: 10),
                          SettingRow(
                            middleWidget: AppSettingTitleText("Use Passkey"),
                            setIcon: SetIcon(icon: Icons.lock),
                            endWidget: MyStyleSwitch(
                              value: usePasscode,
                              onChanged: (val) {
                                setState(() {
                                  usePasscode = val;
                                });
                              },
                            ),
                          ),
                          if (usePasscode)
                            SettingRow(
                                middleWidget: AppSettingTitleText("Pass Code"),
                                setIcon: SetIcon(icon: Icons.password),
                                endWidget: SizedBox(
                                  width: 100,
                                  child: MyStyleTextFormField(
                                    controller: passCodeController,
                                    obscureText: true,
                                    maxLength: 4,
                                    keyboardType: TextInputType.number,
                                    labelText: "Pass code",
                                  ),
                                ))
                        ],
                      ),

                    ///Notifications row
                    SettingRow(
                      middleWidget: AppSettingTitleText("Notifications"),
                      setIcon: SetIcon(icon: Icons.notifications),
                      endWidget: EndSettingRowWidget(
                        icon: _displayNotificationOptions == false
                            ? Icons.chevron_right
                            : Icons.keyboard_arrow_down,
                        onTapArrow: () {
                          setState(() {
                            _displayNotificationOptions =
                                !_displayNotificationOptions;
                          });
                        },
                      ),
                    ),
                    if (_displayNotificationOptions)
                      SectionBox(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          SettingRow(
                              middleWidget:
                                  AppSettingTitleText("Notification type"),
                              setIcon:
                                  SetIcon(icon: Icons.circle_notifications),
                              endWidget: MyStyleDropdownButtonFormField(
                                  value: notificationTypeSelected,
                                  onChanged: (val) {
                                    setState(() {
                                      notificationTypeSelected = val!;
                                    });
                                  },
                                  items: NotificationType.values))
                        ],
                      ),

                    SizedBox(height: 10)
                  ],
                ),
                SizedBox(height: 10),

                /// about box
                SectionBox(
                  children: [
                    SizedBox(height: 10),

                    ///send us message row
                    SettingRow(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SendUsMessageScreen(),
                          ),
                        );
                      },
                      middleWidget: AppSettingTitleText("Send us a message"),
                      setIcon: SetIcon(icon: Icons.send),
                      endWidget: EndSettingRowWidget(),
                    ),

                    ///About us row
                    SettingRow(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AboutUsScreen(),
                          ),
                        );
                      },
                      middleWidget: AppSettingTitleText("About us"),
                      setIcon: SetIcon(icon: Icons.info),
                      endWidget: EndSettingRowWidget(),
                    ),

                    ///FAQ row
                    SettingRow(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FaqsScreen(),
                          ),
                        );
                      },
                      middleWidget: AppSettingTitleText("FAQs"),
                      setIcon: SetIcon(icon: Icons.question_answer),
                      endWidget: EndSettingRowWidget(),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///text of is pro?
  Row _textOfPro() {
    return Row(
      children: [
        Text(
          "You are using the",
          style: TextStyle(color: AppConst.color5),
        ),
        if (!isPro)
          Text(
            " free",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (isPro)
          Text(
            " Pro",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        Text(
          " version.",
          style: TextStyle(color: AppConst.color5),
        ),
      ],
    );
  }
}

///App Setting Title Text
class AppSettingTitleText extends StatelessWidget {
  final String title;

  const AppSettingTitleText(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.clip,
      title,
      style: TextStyle(
        fontSize: 14 + AppConst.plusFontSize,
        fontWeight: FontWeight.bold,
        color: AppConst.color7,
      ),
    );
  }
}

///Go to page
class EndSettingRowWidget extends StatelessWidget {
  final VoidCallback? onTapArrow;
  final IconData? icon;
  final Color? color;

  const EndSettingRowWidget({
    super.key,
    this.onTapArrow,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      hoverColor: AppConst.color2,
      focusColor: AppConst.color2,
      onTap: onTapArrow,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Icon(icon ?? Icons.chevron_right, color: color),
      ),
    );
  }
}

///SetIcon
class SetIcon extends StatelessWidget {
  final IconData icon;

  const SetIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppConst.color2,
        border: Border.all(
          width: 1,
          color: AppConst.color3,
        ),
      ),
      child: Icon(
        icon,
        // size: 25,
        color: AppConst.color6,
      ),
    );
  }
}

///Setting Box
class SectionBox extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  const SectionBox({
    super.key,
    required this.children,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Ink(
        decoration: BoxDecoration(
          color: AppConst.color1,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppConst.color3,
          ),
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

///setting row
class SettingRow extends StatelessWidget {
  final Widget middleWidget;
  final Widget setIcon;
  final Widget endWidget;
  final VoidCallback? onTap;

  const SettingRow({
    super.key,
    required this.middleWidget,
    required this.setIcon,
    required this.endWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      autofocus: true,
      canRequestFocus: true,
      hoverColor: AppConst.color5,
      focusColor: AppConst.color5,
      mouseCursor: MouseCursor.uncontrolled,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            ///Icon
            setIcon,
            SizedBox(width: 10),

            ///Middle row
            middleWidget,
            Spacer(),

            ///end widget
            endWidget
          ],
        ),
      ),
    );
  }
}
