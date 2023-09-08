///
/// list_extension.dart
/// lib/core/extensions
///
///
///

extension StringExtension on List? {
  List ifNull(List value) {
    return this ?? value;
  }
}
