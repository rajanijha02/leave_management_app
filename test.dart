void main(List<String> args) {
  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year, now.month, now.day);

  print(
    DateTime.fromMillisecondsSinceEpoch(
      date.millisecondsSinceEpoch + 1000 * 60 * 60 * 19,
    ).millisecondsSinceEpoch <= now.millisecondsSinceEpoch,
  );
}
