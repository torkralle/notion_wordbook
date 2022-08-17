import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

class VersionChecker {
  Future<VersionCheckStatus> checkIfSupported({
    required PackageInfo packageInfo,
  }) async {
    final Version installedVersion = Version.parse(packageInfo.buildNumber);
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.fetchAndActivate();
      final Version minimumVersion =
          Version.parse(remoteConfig.getString('minimum_supported_version'));
      if (installedVersion >= minimumVersion) {
        // FIXME: バージョンの取得がどっちもうまくなってないンゴ
        debugPrint('いいよ 📲 $installedVersion 🔥→ $minimumVersion');
        return const VersionCheckStatus.onCheckCompleted(isSupported: true);
      } else {
        debugPrint('だめだよ $installedVersion $minimumVersion');
        return const VersionCheckStatus.onCheckCompleted(isSupported: false);
      }
    } on Exception catch (exception) {
      debugPrint('あれれ $exception');
      return VersionCheckStatus.onException(exception: exception);
    }
  }
}

@immutable
class VersionCheckStatus {
  final bool? isSupported;
  final Exception? exception;
  const VersionCheckStatus.onCheckCompleted({
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
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return await versionChecker.checkIfSupported(packageInfo: packageInfo);
});
