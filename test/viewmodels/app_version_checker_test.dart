import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notion_wordbook/viewmodels/app_version_checker.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  test('app version checker ...', () async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    PackageInfo.setMockInitialValues(
      appName: 'notion wordbook',
      packageName: 'com.norihanda.notion_wordbook',
      version: '0.1.0',
      buildNumber: '1',
      buildSignature: '',
    );
    final VersionChecker versionChecker = VersionChecker();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final VersionCheckStatus supported =
        await versionChecker.checkIfSupported(packageInfo: packageInfo);
    expect(
      supported,
      const VersionCheckStatus.onCheckCompleted(isSupported: true),
    );
  });
}
