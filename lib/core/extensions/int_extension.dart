///
/// int_extension.dart
/// lib/core/extensions
///
///
///

extension StringExtension on int? {
  int ifNull(int value) {
    return this ?? value;
  }

  String preventNullString() {
    return this == null ? '' : toString();
  }

  int preventNull() {
    return this ?? 0;
  }
}
