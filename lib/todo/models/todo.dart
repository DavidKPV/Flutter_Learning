class ToDo {
  int? _id;
  String? _title;
  String? _description;
  String? _date;
  int? _priority;

  ToDo (this._title, this._priority, this._date, [this._description]);
  ToDo.withId (this._id, this._title, this._priority, this._date, [this._description]);

  int get id => _id ?? 0;
  String get title => _title ?? "";
  String get description => _description ?? "";
  String get date => _date ?? "";
  int get priority => _priority ?? 3;

  set title (String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description (String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority (int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date (String newDate) {
    _date = newDate;
  }

  Map <String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    map["id"] = _id;
    return map;
  }

  ToDo.fromObject(dynamic obj) {
    _id = obj["id"];
    _title = obj["title"];
    _description = obj["description"];
    _priority = obj["priority"];
    _date = obj["date"];
  }
}