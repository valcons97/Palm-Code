part of 'favorite_page.dart';

@RoutePage()
class FavoritePageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const FavoritePageWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<FavoriteCubit>()..getFavoriteBooks(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const FavoritePage();
  }
}
