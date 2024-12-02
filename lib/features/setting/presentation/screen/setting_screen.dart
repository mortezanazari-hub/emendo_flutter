import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/core/widgets/my_style_dropdown_button_form_field.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  ///fake data of user model
  final _name = "Morteza Nazari";
  final _email = "namo352@gmail.com";
  final _verified = false;
  final _avatarAddress = "lib/core/resources/png/default_avatar.png";
  final isPro = true;

  ///fake setting options

  bool isDarkMode = false;
  String languageSelected = AppConst.languageOptions[0];
  String colorSchemeSelected = AppConst.colorSchemeOptions[0];

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
                  Column(
                    children: [
                      ///Profile Row
                      Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Row(
                          children: <Widget>[
                            ///avatar
                            CircleAvatar(
                              foregroundImage: AssetImage(_avatarAddress),
                              radius: 16,
                            ),

                            SizedBox(width: 10),
                            Column(
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
                                        color: !_verified
                                            ? Colors.red
                                            : AppConst.color4,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),

                            ///Go to page
                            GoToPage(onTapArrow: () {})
                          ],
                        ),
                      ),

                      ///subscription row
                      SettingRow(
                        middleWidget: _textOfPro(),
                        setIcon: SetIcon(icon: Icons.attach_money),
                        endWidget: GoToPage(
                          onTapArrow: () {},
                        ),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ]),

                SizedBox(height: 10),

                ///quick appearance
                SectionBox(
                  children: <Widget>[
                    ///Dark Mode
                    SettingRow(
                      middleWidget: AppSettingTitleText("Dark Mode"),
                      setIcon: SetIcon(icon: Icons.dark_mode),
                      endWidget: Switch(
                          value: isDarkMode,
                          inactiveThumbColor: AppConst.color6,
                          inactiveTrackColor: AppConst.color2,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode = !isDarkMode;
                            });
                          }),
                    ),

                    /// Language Select
                    SettingRow(
                      middleWidget: AppSettingTitleText("Language"),
                      setIcon: SetIcon(icon: Icons.language),
                      endWidget: Expanded(
                        child: myStyleDropdownButtonFormField(
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
                      endWidget: Expanded(
                        child: myStyleDropdownButtonFormField(
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

                    SizedBox(height: 10),

                    // #endregion
                  ],
                ),
                SizedBox(height: 10),

                /// Paged Settings
                SectionBox(
                  children: [
                    ///Appearance row
                    SettingRow(
                      onTap: () {},
                      middleWidget: AppSettingTitleText("Appearance"),
                      setIcon: SetIcon(icon: Icons.format_size),
                      endWidget: GoToPage(
                        onTapArrow: () {},
                      ),
                    ),

                    ///Security row
                    SettingRow(
                      onTap: () {},
                      middleWidget: AppSettingTitleText("Security"),
                      setIcon: SetIcon(icon: Icons.security),
                      endWidget: GoToPage(
                        onTapArrow: () {},
                      ),
                    ),

                    ///Notifications row
                    SettingRow(
                      onTap: () {},
                      middleWidget: AppSettingTitleText("Notifications"),
                      setIcon: SetIcon(icon: Icons.notifications),
                      endWidget: GoToPage(
                        onTapArrow: () {},
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
                SizedBox(height: 10),

                /// about box
                SectionBox(
                  children: [
                    ///send us message row
                    SettingRow(
                      onTap: () {},
                      middleWidget: AppSettingTitleText("Send us a message"),
                      setIcon: SetIcon(icon: Icons.send),
                      endWidget: GoToPage(
                        onTapArrow: () {},
                      ),
                    ),

                    ///About us row
                    SettingRow(
                      onTap: () {},
                      middleWidget: AppSettingTitleText("About us"),
                      setIcon: SetIcon(icon: Icons.info),
                      endWidget: GoToPage(
                        onTapArrow: () {},
                      ),
                    ),

                    ///FAQ row
                    SettingRow(
                      onTap: () {},
                      middleWidget: AppSettingTitleText("FAQs"),
                      setIcon: SetIcon(icon: Icons.question_answer),
                      endWidget: GoToPage(
                        onTapArrow: () {},
                      ),
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
        //fontWeight: FontWeight.bold,
        color: AppConst.color7,
      ),
    );
  }
}

///Go to page
class GoToPage extends StatelessWidget {
  final VoidCallback onTapArrow;

  const GoToPage({
    super.key,
    required this.onTapArrow,
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
        child: Icon(Icons.chevron_right),
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
      padding: EdgeInsets.all(2.5),
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
        size: 25,
        color: AppConst.color6,
      ),
    );
  }
}

///Setting Box
class SectionBox extends StatelessWidget {
  final List<Widget> children;

  const SectionBox({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      hoverColor: AppConst.color2,
      focusColor: AppConst.color2,
      mouseCursor: MouseCursor.uncontrolled,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Row(
          children: <Widget>[
            ///Icon
            setIcon,

            SizedBox(width: 10),

            ///Middle row
            middleWidget,
            Spacer(),

            ///Go to page
            endWidget
          ],
        ),
      ),
    );
  }
}
