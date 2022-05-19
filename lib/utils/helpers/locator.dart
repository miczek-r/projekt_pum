import 'package:get_it/get_it.dart';
import 'package:projekt_pum/utils/services/local_storage.service.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  var lssInctance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(lssInctance);
}