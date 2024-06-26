import 'package:flutter/material.dart';
import 'package:palm_codes/core/core.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.onFieldSubmitted,
    this.controller,
    this.ignoring,
  });

  final Function(String)? onFieldSubmitted;

  final TextEditingController? controller;

  final bool? ignoring;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoring ?? false,
      child: Row(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {},
              child: PalmCodesTextFormField.search(
                textEditingController: controller,
                onFieldSubmitted: onFieldSubmitted,
                context: context,
              ),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
