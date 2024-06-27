part of 'home_page.dart';

@RoutePage()
class HomePageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const HomePageWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
