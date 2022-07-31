import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionChecker {
  Future<VersionCheckStatus> checkIfSupported() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int installedVersion = int.parse(packageInfo.buildNumber);
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.fetchAndActivate();
      int minimumVersion =
          int.parse(remoteConfig.getString('minimum_supported_version'));
      if (installedVersion >= minimumVersion) {
        return const VersionCheckStatus.onOheckComplete(isSupported: true);
      } else {
        return const VersionCheckStatus.onOheckComplete(isSupported: false);
      }
    } on Exception catch (exception) {
      return VersionCheckStatus.onException(exception: exception);
    }
  }
}

@immutable
class VersionCheckStatus {
  final bool? isSupported;
  final Exception? exception;
  const VersionCheckStatus.onOheckComplete({
    required this.isSupported,
  }) : exception = null;
  const VersionCheckStatus.onException({
    required this.exception,
  }) : isSupported = null;
}
