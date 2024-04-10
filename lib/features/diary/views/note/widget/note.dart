class Note {
  String text;
  int emotion;
  List<dynamic> feeling;
  List<dynamic> image;
  DateTime date;
  String id;

  Note({
    required this.id,
    required this.text,
    required this.emotion,
    required this.feeling,
    required this.image,
    required this.date,
  });
}