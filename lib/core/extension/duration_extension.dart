extension DurationExtension on Duration {
  String get minSec => '${inMinutes % 60} min ${inSeconds % 60} sec';

  bool get isZero => inSeconds == 0;

  double get minutes => inMinutes + (inSeconds % 60) / 60;

  String get hhmmss {
    final negativeSign = isNegative ? '-' : '';
    final twoDigitHours = _twoDigits(inHours);
    final twoDigitMinutes = _twoDigits(inMinutes.remainder(60).abs());
    final twoDigitSeconds = _twoDigits(inSeconds.remainder(60).abs());
    return "$negativeSign$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  String get mmss {
    final twoDigitMinutes = _twoDigits(inMinutes.remainder(60).abs());
    final twoDigitSeconds = _twoDigits(inSeconds.remainder(60).abs());
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, "0");
}
