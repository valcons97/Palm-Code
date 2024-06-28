part of 'favorite_page.dart';

@RoutePage()
class FavoritePageWrapper extends StatelessWidget implements AutoRouteWrapper {
  const FavoritePageWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<HomeCubit>().getFavoriteBooks();
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return const FavoritePage();
  }
}
