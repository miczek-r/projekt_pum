import 'package:flutter_appcenter_bundle/flutter_appcenter_bundle.dart';
import 'package:projekt_pum/utils/services/environment.service.dart';

configureAppCenter() async {
  await AppCenter.startAsync(
      appSecretAndroid: Environment().config!.appCenterSecret,
      appSecretIOS: '******',
      enableAnalytics: true,
      enableCrashes: true,
      enableDistribute: true,
      usePrivateDistributeTrack: false,
      disableAutomaticCheckForUpdate: false);
}
