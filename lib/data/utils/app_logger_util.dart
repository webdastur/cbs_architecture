// 📦 Package imports:
import 'package:logger/logger.dart';

/// [AppLoggerUtil] - dasturda consolega log chiqarish uchun ishlatiladi.
///
/// Misol uchun:
/// ```dart
/// AppLoggerUtil.i("Bu shunchaki info uchun");
/// ```
class AppLoggerUtil {
  /// [Logger] ni instanci.
  static Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  /// Debug log uchun.
  ///
  /// [message] - bu consolega chiqariladigan habar.
  static void d(String message) {
    _logger.d(message);
  }

  /// Info log uchun.
  ///
  /// [message] - bu consolega chiqariladigan habar.
  static void i(String message) {
    _logger.i(message);
  }

  /// Warning log uchun.
  ///
  /// [message] - bu consolega chiqariladigan habar.
  static void w(String message) {
    _logger.w(message);
  }

  /// Error log uchun.
  ///
  /// [message] - bu consolega chiqariladigan habar.
  static void e(String message) {
    _logger.e(message);
  }
}
