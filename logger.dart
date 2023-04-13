import 'package:logger/logger.dart';
// void PrintLog.d(msg) {
//   Logger().d(msg);
//   // debugPrint('${'=' * 100}\n$msg\n${'=' * 100}');
//   // log('${'=' * 100}\n$msg\n${'=' * 100}', stackTrace: StackTrace.current);
// }

class PrintLog {
  static bool isDebug = true;

  static Logger logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );

  static void d(message) {
    logger.d(message);
  }

  static void i(message) {
    logger.d(message);
  }

  static void e(message) {
    logger.e(message);
  }
}
