import 'package:flutter/material.dart';
import 'package:palm_codes/core/core.dart';

/// Default tokban scaffold with customisable
/// refresh controller. Contain:
/// - appbar title
/// - appbar widget for custom height
/// - body widget
class PalmCodesScaffold extends StatelessWidget {
  const PalmCodesScaffold({
    super.key,
    this.appbarTitle,
    this.appbar,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.refreshController,
    this.enablePullDown,
    this.enablePullUp = false,
    this.onRefresh,
    this.onLoading,
    this.scrollController,
    this.ignoring,
  });

  final String? appbarTitle;

  final PreferredSizeWidget? appbar;

  final Widget body;

  final Widget? bottomNavigationBar;

  final Widget? floatingActionButton;

  final RefreshController? refreshController;

  final bool? enablePullDown;

  final bool enablePullUp;

  final Function()? onRefresh;

  final Function()? onLoading;

  final ScrollController? scrollController;

  final bool? ignoring;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoring ?? false,
      child: Scaffold(
        appBar: appbarTitle != null
            ? AppBar(
                title: Text(
                  appbarTitle ?? '',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ).withLineHeight(24.sp),
                ),
                elevation: 0,
                centerTitle: true,
              )
            : appbar,
        body: SmartRefresher(
          controller: refreshController ?? RefreshController(),
          enablePullDown: enablePullDown ?? false,
          enablePullUp: enablePullUp,
          scrollController: scrollController,
          onRefresh: onRefresh ?? () => codeLogger.i('Refreshed'),
          onLoading: onLoading,
          child: body,
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: context.res.colors.white,
      ),
    );
  }
}
