/// Check if a string type [value] can be converted to numeric.
String isNumeric(String value) {
  if (value == null || value.isEmpty) {
    return 'Value must not be empty.';
  }
  if (num.tryParse(value) == null && value.isNotEmpty) {
    return 'Value must be numeric.';
  }
  return null;
}

/// Check if a string [value] is empty.
String notEmpty(String value) {
  if (value == null || value.isEmpty) {
    return 'Value must not be empty.';
  }
  return null;
}
