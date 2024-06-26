import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_codes/core/palm_codes_scaffold.dart';
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
            final HomeModel books = state.books ?? HomeModel(books: []);
            body = ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 4).r,
              itemCount: books.books.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(2).r,
                  width: 10,
                  height: 10,
                  color: Colors.red,
                );
              },
            );
          }
        }
        return IgnorePointer(
          ignoring: state.loading == true,
          child: DefaultTabController(
            length: 4,
            child: SafeArea(
              child: PalmCodesScaffold(
                refreshController: refreshController,
                enablePullDown: false,
                scrollController: scrollController,
                body: body,
              ),
            ),
          ),
        );
      },
    );
  }
}
