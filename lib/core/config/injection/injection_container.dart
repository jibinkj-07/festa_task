import '../../../features/home/data/data_source/home_api_data_source.dart';
import '../../../features/home/data/repo/home_repo_impl.dart';
import '../../../features/home/domain/repo/home_repo.dart';
import '../../../features/home/domain/use_case/get_users.dart';
import '../../../features/home/presentation/provider/home_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/auth/data/data_source/auth_api_data_source.dart';
import '../../../features/auth/data/data_source/auth_local_data_source.dart';
import '../../../features/auth/data/repo/auth_repo_impl.dart';
import '../../../features/auth/domain/repo/auth_repo.dart';
import '../../../features/auth/domain/use_case/get_logged_user.dart';
import '../../../features/auth/domain/use_case/login_user.dart';
import '../../../features/auth/domain/use_case/sign_out_user.dart';
import '../../../features/auth/presentation/provider/auth_provider.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  /// **************** PROVIDERS *********************
  sl.registerFactory<AuthProvider>(() => AuthProvider(sl(), sl(), sl()));
  sl.registerFactory<HomeProvider>(() => HomeProvider(sl()));

  /// **************** USE CASES *********************
  sl.registerLazySingleton<GetLoggedUser>(() => GetLoggedUser(sl()));
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl()));
  sl.registerLazySingleton<SignOutUser>(() => SignOutUser(sl()));
  sl.registerLazySingleton<GetUsers>(() => GetUsers(sl()));

  /// **************** REPOS *********************
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(sl(), sl()));

  /// **************** DATA SOURCES *********************
  sl.registerLazySingleton<AuthApiDataSource>(() => AuthApiDataSourceImpl());
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<HomeApiDataSource>(() => HomeApiDataSourceImpl());

  /// **************** EXTERNAL *********************
  final pref = await SharedPreferences.getInstance();
  final internet = InternetConnectionChecker();

  sl.registerLazySingleton<SharedPreferences>(() => pref);
  sl.registerLazySingleton<InternetConnectionChecker>(() => internet);
}
