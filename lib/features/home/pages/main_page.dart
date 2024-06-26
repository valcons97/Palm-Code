import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_codes/features/home/pages/home_nav_observer.dart';

import '../../../core/core.dart';
import '../cubit/home_cubit.dart';
import '../model/bottom_nav.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AfterLayoutMixin<MainPage> {
  Key key = UniqueKey();

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final homeState = context.watch<HomeCubit>().state;

        // Show error page when get home data is error
        if (homeState.flow == HomeFlow.failure) {
          return Placeholder();
        } else {
          {
            return KeyedSubtree(
              key: key,
              child: AutoTabsRouter(
                navigatorObservers: () => [getIt<HomeNavObserver>()],
                routes: const [
                  HomeRoute(),
                ],
                builder: (context, child) {
                  final tabsRouter = AutoTabsRouter.of(context);

                  return PopScope(
                    onPopInvoked: (exit) => _exitApp(tabsRouter),
                    child: PalmCodesScaffold(
                      enablePullDown: false,
                      body: child,
                      bottomNavigationBar: SafeArea(
                        child: SizedBox(
                          height: 64.r,
                          child: BottomNavigationBar(
                            backgroundColor: context.res.colors.white,
                            type: BottomNavigationBarType.fixed,
                            elevation: 0,
                            currentIndex: tabsRouter.activeIndex,
                            selectedLabelStyle: TextStyle(
                              color: context.res.colors.orange,
                              fontFamily: 'Poppins',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelStyle: TextStyle(
                              color: context.res.colors.textGray,
                              fontFamily: 'Poppins',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedItemColor: context.res.colors.textGray,
                            onTap: tabsRouter.setActiveIndex,
                            items: const [
                              BottomNavigationBarItem(
                                icon: Icon(Icons.home),
                                label: 'Home',
                              ),
                              BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.favorite,
                                ),
                                label: 'Liked',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }
      },
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> _exitApp(TabsRouter tabsRouter) async {
    final page = BottomNav.values[tabsRouter.activeIndex];

    switch (page) {
      case BottomNav.home:
        // Exit App on double tap
        final DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          return false;
        }
        return true;
      default:
        // Go home
        tabsRouter.setActiveIndex(BottomNav.home.index);
        return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
