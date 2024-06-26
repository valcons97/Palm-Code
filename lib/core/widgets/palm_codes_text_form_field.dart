import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palm_codes/core/core.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PalmCodesTextFormField extends StatelessWidget {
  const PalmCodesTextFormField({
    super.key,
    this.readOnly = false,
    this.header = true,
    this.enabled,
    this.textEditingController,
    this.onFieldSubmitted,
    this.hintText,
    this.prefixIcon,
    this.contentPadding,
    this.style,
    this.initialValue,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.maxLines,
    this.textInputAction,
    this.validator,
    this.autoValidateMode,
  });

  final bool readOnly;

  final bool header;

  final bool? enabled;

  final TextEditingController? textEditingController;

  final Function(String)? onFieldSubmitted;

  final String? hintText;

  final Widget? prefixIcon;

  final EdgeInsets? contentPadding;

  final TextStyle? style;

  final String? initialValue;

  final Function(String)? onChanged;

  // Define input for field
  final List<TextInputFormatter>? inputFormatters;

  // Define keyboard type for field
  final TextInputType? keyboardType;

  // Field max lines
  final int? maxLines;

  // input action for textformfield
  final TextInputAction? textInputAction;

  final String? Function(String? val)? validator;

  final AutovalidateMode? autoValidateMode;

  factory PalmCodesTextFormField.search({
    required BuildContext context,
    TextEditingController? textEditingController,
    Function(String)? onFieldSubmitted,
    String? initialValue,
    bool? readOnly,
    bool? enabled,
  }) {
    return PalmCodesTextFormField(
      textEditingController: textEditingController,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      maxLines: 1,
      readOnly: readOnly ?? false,
      enabled: enabled,
      style: initialValue != null
          ? TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: context.res.colors.black100,
            ).withLineHeight(18.sp)
          : null,
      prefixIcon: Icon(
        Icons.search,
        size: 28.sp,
        color: context.res.colors.textGray,
      ),
    );
  }

  factory PalmCodesTextFormField.done({
    TextEditingController? textEditingController,
    Function(String)? onFieldSubmitted,
    Function(String)? onChanged,
    String? hintText,
    String? initialValue,
    Widget? prefixIcon,
    EdgeInsets? contentPadding,
    bool? readOnly,
    bool? enabled,
  }) {
    return PalmCodesTextFormField(
      textEditingController: textEditingController,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      hintText: hintText,
      initialValue: initialValue,
      contentPadding: contentPadding,
      textInputAction: TextInputAction.done,
      readOnly: readOnly ?? false,
      enabled: enabled,
      prefixIcon: prefixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final res = context.res;
    final bool enableInteractiveSelection;
    final Color fillColor;
    if (readOnly == true) {
      enableInteractiveSelection = false;
      if (header == true) {
        fillColor = res.colors.white;
      } else {
        fillColor = res.colors.lightGray20;
      }
    } else {
      enableInteractiveSelection = true;
      fillColor = res.colors.white;
    }
    return Skeleton.keep(
      child: Skeleton.keep(
        child: TextFormField(
          readOnly: readOnly,
          enableInteractiveSelection: enableInteractiveSelection,
          enabled: enabled,
          controller: textEditingController,
          initialValue: initialValue,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          minLines: maxLines != null ? 1 : null,
          maxLines: maxLines,
          onFieldSubmitted: onFieldSubmitted ?? (search) {},
          onChanged: onChanged ?? (value) {},
          style: style,
          validator: validator,
          autovalidateMode: autoValidateMode,
          decoration: InputDecoration(
            hintText: hintText ?? 'Search',
            hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: context.res.colors.hintText,
            ).withLineHeight(18.sp),
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ).r,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: fillColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide(color: context.res.colors.lightGray20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide(color: context.res.colors.lightGray20),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide(color: context.res.colors.lightGray20),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide(color: context.res.colors.lightGray20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).r,
              borderSide: BorderSide(color: context.res.colors.lightGray20),
            ),
          ),
        ),
      ),
    );
  }
}
