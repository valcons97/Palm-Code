import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_codes/core/core.dart';
import 'package:palm_codes/features/home/cubit/detail/detail_cubit.dart';
import 'package:palm_codes/features/index.dart';

import '../../widgets/detail/book_name_and_author_tile.dart';

part 'wrapper.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final PersonModel firstAuthor = book.authors.isNotEmpty
        ? book.authors.first
        : const PersonModel(name: 'Uknown');

    return Builder(builder: (context) {
      final state = context.watch<DetailCubit>().state;
      return PalmCodesScaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0).r,
                  child: GestureDetector(
                      onTap: () {
                        context
                            .read<DetailCubit>()
                            .setFavorite(book.id.toString(), book);
                      },
                      child: state.favorite!
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border_outlined)),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Detail',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: context.res.colors.black100,
                  ).withLineHeight(28.8.sp),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 8.h),
                  PalmCodesImage(
                    padding: EdgeInsets.symmetric(horizontal: 64.w),
                    url: book.formats["image/jpeg"] ?? '',
                  ),
                  BookNameAndAuthorTile(
                    title: book.title,
                    author: firstAuthor.name,
                    birth: firstAuthor.birthYear,
                    death: firstAuthor.deathYear,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 54.h),
            ),
          ],
        ),
      );
    });
  }
}
