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

  // Show as hours + minutes + seconds as "15h20m30s"
  // If hours and minutes and seconds is 0, return "0"
  String get hhmmssString {
    final hours = inHours > 0 ? '${inHours}h' : '';
    final minutes = inMinutes.remainder(60) > 0
        ? '${inMinutes.remainder(60)}m'
        : '';
    final seconds = inSeconds.remainder(60) > 0
        ? '${inSeconds.remainder(60)}s'
        : '';

    if (hours.isEmpty && minutes.isEmpty && seconds.isEmpty) {
      return '0';
    }
    return '$hours$minutes$seconds';
  }
}
