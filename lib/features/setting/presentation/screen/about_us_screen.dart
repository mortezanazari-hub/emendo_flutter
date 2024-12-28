import 'package:emendo/core/utils/app_const.dart';
import 'package:emendo/features/setting/presentation/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/about_model.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreen();
}

class _AboutUsScreen extends State<AboutUsScreen> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _canLunchUrl(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch email client');
    }
  }

  final newVersionAvailable = false;
  final model = AboutModel(
      lastVersion: "1.0.0 beta",
      aboutText:
          "Emendo is an open source software designed and developed by the EmenSoft team. In addition to using the application, you can also access its source on our GitHub.",
      githubUrl: "https://github.com/mortezanazari-hub/emendo_flutter",
      siteUrl: "https://emendo.com",
      supportEmail: "support@example.com",
      storeUrl: "https://play.google.com/store/apps/details?id=com.todoist",
      telegramUrl: "https://t.me/emensoft");

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
            child: Icon(
              Icons.arrow_back,
              color: AppConst.color7,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'About us',
          style: TextStyle(color: AppConst.color7),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // SizedBox(height: 15),
              SectionBox(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      model.aboutText,
                      style: TextStyle(color: AppConst.color6),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              ///version
              SectionBox(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "Version:",
                          style: TextStyle(color: AppConst.color7),
                        ),
                        Spacer(),
                        Text(
                          AppConst.appVersion,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppConst.color6),
                        ),
                        if (newVersionAvailable) SizedBox(width: 10),
                        if (newVersionAvailable)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            decoration: BoxDecoration(
                                color: AppConst.color4,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "New version available",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppConst.color6),
                            ),
                          ),
                        Spacer(),
                        EndSettingRowWidget(
                          color: AppConst.color6,
                          onTapArrow: () {},
                          icon: Icons.refresh,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ///Site
              if (model.siteUrl != null) SizedBox(height: 10),
              if (model.siteUrl != null)
                SectionBox(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Our site:",
                            style: TextStyle(color: AppConst.color7),
                          ),
                          Spacer(),
                          Text(
                            model.siteUrl!.split('/')[2],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppConst.color6),
                          ),
                          Spacer(),
                          EndSettingRowWidget(
                            color: AppConst.color7,
                            onTapArrow: () {
                              final Uri uri = Uri.parse(model.siteUrl!);
                              _launchUrl(uri);
                            },
                            // icon: Icons.refresh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ///Github
              if (model.githubUrl != null) SizedBox(height: 10),
              if (model.githubUrl != null)
                SectionBox(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Github:",
                            style: TextStyle(color: AppConst.color7),
                          ),
                          Spacer(),
                          Text(
                            model.githubUrl!.split('/').last,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppConst.color6),
                          ),
                          Spacer(),
                          EndSettingRowWidget(
                            color: AppConst.color7,
                            onTapArrow: () {
                              final Uri uri = Uri.parse(model.githubUrl!);
                              _launchUrl(uri);
                            },
                            // icon: Icons.refresh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ///Support Email
              if (model.supportEmail != null) SizedBox(height: 10),
              if (model.supportEmail != null)
                SectionBox(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Email:",
                            style: TextStyle(color: AppConst.color7),
                          ),
                          Spacer(),
                          Text(
                            model.supportEmail!.replaceAll('@', " [at] "),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppConst.color6),
                          ),
                          Spacer(),
                          EndSettingRowWidget(
                            color: AppConst.color7,
                            onTapArrow: () {
                              final Uri uri = Uri.parse(
                                  "mailto:${model.supportEmail!}?subject=Support Request");
                              _canLunchUrl(uri);
                            },
                            // icon: Icons.refresh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ///Telegram
              if (model.telegramUrl != null) SizedBox(height: 10),
              if (model.telegramUrl != null)
                SectionBox(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Telegram:",
                            style: TextStyle(color: AppConst.color7),
                          ),
                          Spacer(),
                          Text(
                            "@${model.telegramUrl!.split('/').last}",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppConst.color6),
                          ),
                          Spacer(),
                          EndSettingRowWidget(
                            color: AppConst.color7,
                            onTapArrow: () {
                              final Uri uri =
                                  Uri.parse("tg:${model.telegramUrl!}");
                              _launchUrl(uri);
                            },
                            // icon: Icons.refresh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ///Store
              if (model.storeUrl != null) SizedBox(height: 10),
              if (model.storeUrl != null)
                SectionBox(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "App Store:",
                            style: TextStyle(color: AppConst.color7),
                          ),
                          Spacer(),
                          Text(
                            model.storeUrl!.split('/')[2],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppConst.color6),
                          ),
                          Spacer(),
                          EndSettingRowWidget(
                            color: AppConst.color7,
                            onTapArrow: () {
                              final Uri uri = Uri.parse(model.storeUrl!);
                              _launchUrl(uri);
                            },
                            // icon: Icons.refresh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
