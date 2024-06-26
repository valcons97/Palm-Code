import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // if (discountProductState.flow.name == 'failure') {
        //   return TokbanErrorPage(
        //     onPressed: () =>
        //         context.read<DiscountProductCubit>().getDiscountProduct(),
        //   );
        // } else if (discountProductState.flow.name == 'loaded') {
        //   if (discountProductState.loading == true) {
        //     body = Skeletonizer(child: Container(height: 200));
        //   }
        //   // loaded body in here
        // }

        return const Placeholder();
      },
    );
  }
}
