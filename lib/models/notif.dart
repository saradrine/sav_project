class Notif {
  final String text;
  final DateTime date;
  final bool isUnRead;

  Notif({
    required this.text,
    required this.date,
    this.isUnRead = false,
  });
}