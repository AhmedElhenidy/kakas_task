
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth_feature/data/data_source/auth_remote_data_source.dart';
import '../../features/auth_feature/data/repo_impl/auth_repo_impl.dart';
import '../../features/auth_feature/domain/repo/auth_repo.dart';
import '../../features/auth_feature/domain/usecases/auth_usecases/signin_usecase.dart';
import '../../features/auth_feature/domain/usecases/auth_usecases/signup_usecase.dart';
import '../../features/booking_feature/data/data_source/booking_remote_data_source.dart';
import '../../features/booking_feature/data/repo_impl/booking_repo_impl.dart';
import '../../features/booking_feature/domain/repo/booking_repo.dart';
import '../../features/booking_feature/domain/usecases/booking_usecases/add_product_usecase.dart';
import '../../features/booking_feature/domain/usecases/booking_usecases/get_barber_times_usecase.dart';
import '../../features/booking_feature/domain/usecases/booking_usecases/get_barbers_usecase.dart';
import '../../features/booking_feature/domain/usecases/booking_usecases/get_home_usecase.dart';
import '../../features/profile_feature/data/data_source/account_remote_data_source.dart';
import '../../features/profile_feature/data/repo_impl/account_repo_impl.dart';
import '../../features/profile_feature/domain/repo/account_repo.dart';
import '../../features/profile_feature/domain/usecases/get_profile_usecase.dart';
import '../network/network_info.dart';
import '../network/network_manager.dart';
import '../services/cache_service.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerSingleton<NavHelper>(NavHelper());

  // data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(networkManager: getIt()),);
  getIt.registerLazySingleton<BookingRemoteDataSource>(() => BookRemoteDataSourceImpl(networkManager: getIt()),);
  getIt.registerLazySingleton<AccountRemoteDataSource>(() => AccountRemoteDataSourceImpl(networkManager: getIt()),);

  //* Repository
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(authRemoteDataSource: getIt(), networkInfo: getIt()),);
  getIt.registerLazySingleton<BookingRepo>(() => BookingRepoImpl(bookingRemoteDataSource: getIt(), networkInfo: getIt(),),);
  getIt.registerLazySingleton<AccountRepo>(() => AccountRepoImpl(accountRemoteDataSource: getIt(), networkInfo: getIt()),);

  //* Use cases
  _authUseCases();
  _accountUseCases();
  _bookingUseCases();


  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  getIt.registerLazySingleton<CacheService>(() => CacheService());
}

void _authUseCases() {
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(repository: getIt()));
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(repository: getIt()));

}


void _accountUseCases() {
  getIt.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(repository: getIt()));
}


void _bookingUseCases() {
  getIt.registerLazySingleton<GetHomeUseCase>(() => GetHomeUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetBarbersUseCase>(() => GetBarbersUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetBarberTimesUseCase>(() => GetBarberTimesUseCase(repository: getIt()));
  getIt.registerLazySingleton<AddProductUseCase>(() => AddProductUseCase(repository: getIt()));
}

