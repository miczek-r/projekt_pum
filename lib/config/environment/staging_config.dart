import 'package:projekt_pum/config/environment/base_config.dart';

class StagingConfig implements BaseConfig {
  @override
  String get appCenterSecret => '419c7b15-b2c6-4661-9935-2a2ead58f3f2';

  @override
  bool get reportEvents => false;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => false;
}
