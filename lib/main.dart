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
import 'features/home/cubit/home/home_cubit.dart';

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

  await Hive.openBox('ttl');
  await Hive.openBox('book');
  await Hive.openBox('favoriteBooks');
  await Hive.openBox('books');

  final ttl = Hive.box('ttl');
  if (ttl.get('1') == null) {
    ttl.put('1', DateTime.now());
  } else {
    final DateTime cacheDate = ttl.get('1');
    final now = DateTime.now();

    if (now.difference(cacheDate).inDays > 0) {
      ttl.put('1', DateTime.now());
      // clear books list with TTL for 1 day
      await Hive.box('books').clear();
      await Hive.box('favoriteBooks').clear();
      await Hive.box('book').clear();
    }
  }

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
