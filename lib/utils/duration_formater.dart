String format(Duration duration) {
  final twoDigitsMinutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final twoDigitsSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

  return '$twoDigitsMinutes : $twoDigitsSeconds';
}
