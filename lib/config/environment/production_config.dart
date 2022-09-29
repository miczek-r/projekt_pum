import 'package:projekt_pum/config/environment/base_config.dart';

class ProductionConfig implements BaseConfig {
  @override
  String get appCenterSecret => throw UnimplementedError();

  @override
  bool get reportEvents => true;

  @override
  bool get trackEvents => true;

  @override
  bool get useHttps => false;
}
