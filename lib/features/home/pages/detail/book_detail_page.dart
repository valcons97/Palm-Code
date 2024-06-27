import 'package:flutter/material.dart';
import 'package:palm_codes/core/core.dart';
import 'package:palm_codes/features/home/model/book_model.dart';

part 'wrapper.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return PalmCodesScaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(book.title),
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
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 54.h),
          ),
        ],
      ),
    );
  }
}
