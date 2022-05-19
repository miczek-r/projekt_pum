import 'package:projekt_pum/config/environment/base_config.dart';

class DevelopmentConfig implements BaseConfig {
  @override
  String get appCenterSecret => '0cd919ff-c835-4bc3-bd9e-b14d35d34e5a';

  @override
  bool get reportEvents => false;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => false;
}
