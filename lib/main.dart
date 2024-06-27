import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:palm_codes/features/index.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'core/core.dart';
import 'core/di/config/di_config.dart';
import 'core/navigation_observer.dart';
import 'features/home/cubit/home_cubit.dart';

final router = getIt<AppRouter>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: 'env/.env');

  await configureInjection(determineEnvironment());

  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter<BookModel>(BookModelAdapter());
  Hive.registerAdapter<HomeModel>(HomeModelAdapter());
  Hive.registerAdapter<PersonModel>(PersonModelAdapter());

  await Hive.openBox('book');
  await Hive.openBox('favoriteBook');
  await Hive.openBox('books');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<HomeCubit>()..getBooks(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

String determineEnvironment() {
  if (DiConfig.enableDummyRepos) {
    return Env.dummy;
  }

  if (kReleaseMode == true) {
    return Env.prod;
  }

  return Env.dev;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, _) {
        return RefreshConfiguration(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.orange,
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent,
              ),
              appBarTheme: const AppBarTheme(
                color: Colors.white,
              ),
            ),
            routerDelegate: router.delegate(
              navigatorObservers: () => [NavigationObserver()],
            ),
            routeInformationParser: router.defaultRouteParser(),
          ),
        );
      },
    );
  }
}
