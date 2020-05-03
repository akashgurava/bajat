/// Check if a string type [amount] can be converted to numeric.
String isInt(String amount) {
  if (num.tryParse(amount) == null && amount.isNotEmpty) {
    return 'Amount should not contain text';
  }
  return null;
}

/// Helper class to say no extra data needed
class NoExtraData {}
