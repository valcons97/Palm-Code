import 'package:flutter/material.dart';
import 'package:palm_codes/core/core.dart';
import 'package:palm_codes/features/home/model/book_model.dart';

class BookContainer extends StatelessWidget {
  const BookContainer({
    super.key,
    this.dimension = '',
    this.book,
    this.isLoading = false,
  });

  final String dimension;

  final BookModel? book;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              const Radius.circular(8).r,
            ),
            color: context.res.colors.white,
            boxShadow: [
              BoxShadow(
                color: context.res.colors.shadow,
                blurRadius: 3,
                offset: const Offset(
                  0,
                  1,
                ),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70.h,
                width: 70.w,
                child: PalmCodesImage(
                  padding: EdgeInsets.zero,
                  url: book?.formats["image/jpeg"] ?? '',
                  isLoading: isLoading,
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(right: 2.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book?.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: context.res.colors.black100,
                        ).withLineHeight(21.sp),
                      ),
                      SizedBox(height: 8.h),
                      if (dimension.isNotEmpty) ...[
                        Text(
                          dimension,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: context.res.colors.lightGray60,
                          ).withLineHeight(19.2.sp),
                        ),
                        SizedBox(height: 8.h),
                      ],
                      Text(
                        book?.authors.first.name ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: context.res.colors.orange,
                        ).withLineHeight(21.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
