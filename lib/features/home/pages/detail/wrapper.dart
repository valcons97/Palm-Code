part of 'book_detail_page.dart';

@RoutePage()
class BookDetailPageWrapper extends StatelessWidget
    implements AutoRouteWrapper {
  const BookDetailPageWrapper({
    super.key,
    required this.bookDetail,
  });

  final BookModel bookDetail;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<DetailCubit>()..getFavorite(bookDetail.id.toString()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BookDetailPage(book: bookDetail);
  }
}
