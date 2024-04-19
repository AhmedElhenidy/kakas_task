
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app/services/cache_service.dart';
import 'app/themes/get_theme.dart';
import 'app/utils/get_it_injection.dart';
import 'app/utils/language_manager.dart';

import 'app/utils/navigation_helper.dart';
import 'features/auth_feature/presentation/presentation_logic_holder/auth_cubit/auth_cubit.dart';
import 'features/booking_feature/presentation/presentation_logic_holder/booking_cubit.dart';
import 'features/bottom_navigation_feature/presentation/presentation_logic_holder/bottom_navigation_cubit.dart';
import 'features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'features/profile_feature/presentation/presentation_logic_holder/account_cubit.dart';
import 'features/intro_feature/presentation/screens/select_language_screen.dart';

void main() async{
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [

        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<BookingCubit>(
          create: (BuildContext context) => BookingCubit(),
        ),
        BlocProvider<AccountCubit>(
          create: (BuildContext context) => AccountCubit(),
        ),

        BlocProvider<BottomNavigationCubit>(
          create: (BuildContext context) => BottomNavigationCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        english_local,
        arabic_local,
      ],
      path: assets_path_localisations,
      fallbackLocale: english_local,
      //
      //* OverlaySupport
      //
      child: OverlaySupport.global(
        //
        //* ScreenUtilInit
        //
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          //
          //* MaterialApp
          //
          builder: (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            // locale: CookieManagerService.getLocale,
            locale: context.locale,
            title: 'Kakas',
            debugShowCheckedModeBanner: false,
            theme: KakasTheme(),
            navigatorKey: getIt<NavHelper>().navigatorKey,
            //
            //* EasyLoading
            //
            builder: EasyLoading.init(
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
            ),
            home: getIt<CacheService>().getUserToken() == null
                ? const SelectLanguageScreen()
                : const CliqueBottomNavigation(),
          ),
        ),
      ),
    );
  }
}

