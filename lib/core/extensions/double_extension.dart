///
/// int_extension.dart
/// lib/core/extensions
///
///
///

extension DoubleExtension on double? {
  double ifNull(double value) {
    return this ?? value;
  }
}
