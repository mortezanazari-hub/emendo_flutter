import 'dart:ffi';

class AboutModel {
  final String? siteUrl;
  final String aboutText;
  final String? storeUrl;
  final String? githubUrl;
  final String? telegramUrl;
  final String? supportEmail;

  final String lastVersion;
  late int firstOfLastVersion;
  late int? secondOfLastVersion;
  late int? thirdOfLastVersion;
  late bool isBetaOrAlpha;

  AboutModel({
    this.supportEmail,
    required this.lastVersion,
    this.siteUrl,
    required this.aboutText,
    this.storeUrl,
    this.githubUrl,
    this.telegramUrl,
  }) {
    versionGetter(lastVersion);
  }

  versionGetter(String version) {
    version = version.toLowerCase();
    final versionParts = version.split(RegExp(r'\.|\s'));
    firstOfLastVersion = int.parse(versionParts[0]);
    secondOfLastVersion =
        versionParts.length >= 2 ? int.tryParse(versionParts[2]) : null;
    thirdOfLastVersion =
        versionParts.length >= 3 ? int.tryParse(versionParts[2]) : null;
    isBetaOrAlpha = version.contains('beta') ||
        version.contains('alpha') ||
        version.contains('a') ||
        version.contains('b');
  }
}
