import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palm_codes/core/core.dart';
import 'package:palm_codes/features/home/cubit/home/home_cubit.dart';

import '../../home_index.dart';

part 'wrapper.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final state = context.watch<HomeCubit>().state;

      return PalmCodesScaffold(
        body: SafeArea(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 4).r,
            itemCount: state.bookList?.length,
            itemBuilder: (context, index) {
              return BookContainer(book: state.bookList?[index]);
            },
          ),
        ),
      );
    });
  }
}
