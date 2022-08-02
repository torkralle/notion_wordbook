import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionChecker {
  Future<VersionCheckStatus> checkIfSupported() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final int installedVersion = int.parse(packageInfo.buildNumber);
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.fetchAndActivate();
      final int minimumVersion =
          int.parse(remoteConfig.getString('minimum_supported_version'));
      if (installedVersion >= minimumVersion) {
        return const VersionCheckStatus.onOheckCompleted(isSupported: true);
      } else {
        return const VersionCheckStatus.onOheckCompleted(isSupported: false);
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
  const VersionCheckStatus.onOheckCompleted({
    required this.isSupported,
  }) : exception = null;
  const VersionCheckStatus.onException({
    required this.exception,
  }) : isSupported = null;
}

final FutureProvider<VersionCheckStatus> versionCheckStatusProvider =
    FutureProvider<VersionCheckStatus>(
        (FutureProviderRef<VersionCheckStatus> ref) async {
  final VersionChecker versionChecker = VersionChecker();
  return versionChecker.checkIfSupported();
});
