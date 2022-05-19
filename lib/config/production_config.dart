import 'package:projekt_pum/config/environment/base_config.dart';

class ProductionConfig implements BaseConfig {
  @override
  String get appCenterSecret => throw UnimplementedError();

  @override
  bool get reportEvents => false;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => false;
}
