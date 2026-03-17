import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/api_client.dart';
import '../network/network_info.dart';
import '../../features/donatur/data/datasources/donatur_remote_datasource.dart';
import '../../features/donatur/data/repositories/donatur_repository_impl.dart';
import '../../features/donatur/domain/repositories/donatur_repository.dart';

final getIt = GetIt.instance;

/// Inisialisasi dependency injection.
/// Dipanggil satu kali di main() sebelum runApp().
Future<void> configureDependencies() async {
  // External dependencies
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  const storage = FlutterSecureStorage();
  getIt.registerSingleton<FlutterSecureStorage>(storage);

  getIt.registerSingleton<Connectivity>(Connectivity());

  // Core
  getIt.registerSingleton<NetworkInfo>(
    NetworkInfoImpl(getIt<Connectivity>()),
  );
  getIt.registerSingleton<ApiClient>(
    ApiClient(getIt<FlutterSecureStorage>()),
  );

  // Donatur
  getIt.registerLazySingleton<DonaturRemoteDatasource>(
    () => DonaturRemoteDatasourceImpl(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<DonaturRepository>(
    () => DonaturRepositoryImpl(getIt<DonaturRemoteDatasource>()),
  );
}
