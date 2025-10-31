extension StringExtension on String {
  bool get isValidEmail {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    return isNotEmpty && RegExp(pattern).hasMatch(this);
  }

  bool get isValidPassword {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return isNotEmpty && RegExp(pattern).hasMatch(this);
  }

  DateTime toDateTime() {
    return DateTime.parse(this);
  }

  String get capitalized {
    if (isEmpty) return this;

    return replaceRange(0, 1, this[0].toUpperCase());
  }

  String get capitalizeAllFirstLetter {
    if (isEmpty) return this;

    return split(' ').map((word) => word.capitalized).join(' ');
  }

  bool get isValidUrl {
    if (isEmpty) return false;
    final uri = Uri.tryParse(this);
    return uri != null &&
        (uri.isScheme('http') || uri.isScheme('https')) &&
        uri.host.isNotEmpty;
  }
}

extension NullStringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
