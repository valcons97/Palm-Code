import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_codes/features/home/cubit/home_cubit.dart';
import 'package:palm_codes/features/home/home_index.dart';

import '../../../core/core.dart';

part 'wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final refreshController = RefreshController();
    final scrollController = ScrollController();

    return Builder(
      builder: (context) {
        final state = context.watch<HomeCubit>().state;

        late Widget body;

        if (state.flow.name == 'failure') {
          refreshController.loadFailed();
          return const Placeholder();
        } else if (state.flow.name == 'loaded') {
          if (state.loading == true) {
            body = const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final HomeModel books =
                state.model ?? const HomeModel(books: [], next: '');
            body = ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 4).r,
              itemCount: books.books.length,
              itemBuilder: (context, index) {
                return BookContainer(book: books.books[index]);
              },
            );
          }
        }
        return IgnorePointer(
          ignoring: state.loading == true,
          child: SafeArea(
            child: PalmCodesScaffold(
              appbar: AppBar(
                title: SearchBarWidget(
                  onFieldSubmitted: (search) {
                    context.read<HomeCubit>().setSearch(search);
                  },
                ),
              ),
              refreshController: refreshController,
              enablePullUp: state.model?.next.isNotEmpty ?? false,
              enablePullDown: false,
              scrollController: scrollController,
              onLoading: () async {
                refreshController.isLoading;
                await context.read<HomeCubit>().addPage();
                refreshController.loadComplete();
              },
              body: body,
            ),
          ),
        );
      },
    );
  }
}
