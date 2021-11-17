class News {
  String _title = "";
  String _description = "";
  late DateTime _date;

  News(String title, String description) {
    _title = title;
    _description = description;
    _date = DateTime.now();
  }

  DateTime getDate() {
    return _date;
  }

  String getTitle() {
    return _title;
  }
}
