import 'package:logger/logger.dart';

export 'package:auto_route/auto_route.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

export '../utils/_utils.dart';
export 'di/injection.dart';
export 'enums.dart';
export 'errors/failure.dart';
export 'extensions/extensions.dart';
export 'resources/resources.dart';
export 'router/router.dart';
export 'storage/storage.dart';
export 'theme/theme.dart';
export 'widgets/widgets.dart';

Logger tokbanLogger = Logger(printer: PrettyPrinter());
