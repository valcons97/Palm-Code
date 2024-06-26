import 'package:flutter/material.dart';

/// Contains color palette used by the app.
///
/// Currently contains only light theme colors.
/// In the future when we implement dark theme, this will be changed into
/// an abstract class
class AppColors {
  // Common colors
  Color get white => const Color(0xFFFFFFFF);
  Color get orange => const Color(0xFFF08227);
  Color get orange2 => const Color(0xFFFFA300);
  Color get orange3 => const Color(0xFFF1D6C0);
  Color get orange4 => const Color(0xFFFFF4EB);
  Color get yellow => const Color(0xFFFFB700);

  // Background colors
  LinearGradient get appGradient => const LinearGradient(
        colors: [
          Color(0xffF08227),
          Color(0xffFF9742),
        ],
      );
  Color get bgBlack => const Color(0xFF000000);
  Color get lightWhite20 => const Color(0xFFF9F9F9);

  // Notification colors
  Color get danger => const Color(0xFFE25C5C);
  Color get info => const Color(0xFF2685CA);
  Color get warning => const Color(0xFFFCD95D);
  Color get success => const Color(0xFF53D258);

  // Black
  Color get black100 => const Color(0xFF2C3131);

  // Text Color
  Color get textBlack => const Color(0xFF1D2125);
  Color get textGray => const Color(0xFF9B9B9B);

  Color get darkGray80 => const Color(0xFF626262);
  Color get hintText => const Color(0xFFA9A9A9);

  // Light Gray
  Color get lightGray20 => const Color(0xFFE9E9E9);
  Color get lightGray40 => const Color(0xFFCACACA);
  Color get lightGray60 => const Color(0xFFA9A9A9);
  Color get lightGray80 => const Color(0xFF626262);

  // Button Color
  Color get lightGrayButton1 => const Color(0xFFDADADA);
  Color get lightGrayButton2 => const Color(0xFFEEEEEE);

  // Button Color
  Color get shadow => Colors.black.withOpacity(0.12);

  // Notification Color
  Color get notificationColorUnread => const Color(0xFFFFF3E9);
}
