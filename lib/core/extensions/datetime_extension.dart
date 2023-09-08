///
/// datetime_extension.dart
/// lib/core/extensions
///
///
///

extension DateTimeExtension on DateTime? {
  DateTime ifNull(DateTime value) {
    return this ?? value;
  }
}
