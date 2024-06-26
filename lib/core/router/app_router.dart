import '../../features/index.dart';
import '../core.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'PageWrapper|Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      initial: true,
      page: MainRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
      ],
    ),
  ];
}
