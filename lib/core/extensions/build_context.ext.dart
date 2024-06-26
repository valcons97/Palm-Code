import 'package:flutter/material.dart';

import '../resources/resources.dart';

extension BuildContextX on BuildContext {
  /// TODO: add BuildContext into Resources when it's necessary
  Resources get res => const Resources();
}
