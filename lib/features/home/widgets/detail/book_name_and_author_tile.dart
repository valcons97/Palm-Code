import 'package:flutter/material.dart';
import 'package:palm_codes/core/core.dart';

class BookNameAndAuthorTile extends StatelessWidget {
  const BookNameAndAuthorTile({
    super.key,
    required this.title,
    required this.author,
    this.birth,
    this.death,
  });

  final String title;
  final String author;
  final int? birth;
  final int? death;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            key: ValueKey<String>(title),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: context.res.colors.black100,
            ).withLineHeight(28.8.sp),
          ),
          SizedBox(height: 16.h),
          Text(
            '$author ,${birth ?? 0} - ,${death ?? 0}',
            key: ValueKey<String>(author),
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: context.res.colors.orange,
            ).withLineHeight(24.sp),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
