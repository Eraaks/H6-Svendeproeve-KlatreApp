class ClimbingCenter {
  String? _centerName;
  String? _description;
  String? _location;
  String? _moderatorCode;
  List<String>? _moderators;
  List<String>? _areaNames;
  List<Areas>? _areas;

  ClimbingCenter(
      {String? centerName,
      String? description,
      String? location,
      String? moderatorCode,
      List<String>? moderators,
      List<String>? areaNames,
      List<Areas>? areas}) {
    if (centerName != null) {
      _centerName = centerName;
    }
    if (description != null) {
      _description = description;
    }
    if (location != null) {
      _location = location;
    }
    if (moderatorCode != null) {
      _moderatorCode = moderatorCode;
    }
    if (moderators != null) {
      _moderators = moderators;
    }
    if (areaNames != null) {
      _areaNames = areaNames;
    }
    if (areas != null) {
      _areas = areas;
    }
  }

  String? get centerName => _centerName;
  set centerName(String? centerName) => _centerName = centerName;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get moderatorCode => _moderatorCode;
  set moderatorCode(String? moderatorCode) => _moderatorCode = moderatorCode;
  List<String>? get moderators => _moderators;
  set moderators(List<String>? moderators) => _moderators = moderators;
  List<String>? get areaNames => _areaNames;
  set areaNames(List<String>? areaNames) => _areaNames = areaNames;
  List<Areas>? get areas => _areas;
  set areas(List<Areas>? areas) => _areas = areas;

  ClimbingCenter.fromJson(Map<String, dynamic> json) {
    _centerName = json['centerName'];
    _description = json['description'];
    _location = json['location'];
    _moderatorCode = json['moderator_Code'];
    _moderators = json['moderators'].cast<String>();
    _areaNames = json['areaNames'].cast<String>();
    if (json['areas'] != null) {
      _areas = <Areas>[];
      json['areas'].forEach((v) {
        _areas!.add(new Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['centerName'] = _centerName;
    data['description'] = _description;
    data['location'] = _location;
    data['moderator_Code'] = _moderatorCode;
    data['moderators'] = _moderators;
    data['areaNames'] = _areaNames;
    if (_areas != null) {
      data['areas'] = _areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Areas {
  String? _name;
  String? _description;
  List<AreaRoutes>? _areaRoutes;

  Areas({String? name, String? description, List<AreaRoutes>? areaRoutes}) {
    if (name != null) {
      _name = name;
    }
    if (description != null) {
      _description = description;
    }
    if (areaRoutes != null) {
      _areaRoutes = areaRoutes;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  List<AreaRoutes>? get areaRoutes => _areaRoutes;
  set areaRoutes(List<AreaRoutes>? areaRoutes) => _areaRoutes = areaRoutes;

  Areas.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _description = json['description'];
    if (json['areaRoutes'] != null) {
      _areaRoutes = <AreaRoutes>[];
      json['areaRoutes'].forEach((v) {
        _areaRoutes!.add(new AreaRoutes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = _name;
    data['description'] = _description;
    if (_areaRoutes != null) {
      data['areaRoutes'] = _areaRoutes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaRoutes {
  String? _id;
  String? _color;
  String? _grade;
  List<String>? _usersWhoCompleted;
  List<String>? _usersWhoFlashed;
  int? _number;
  String? _assignedArea;

  AreaRoutes(
      {String? id,
      String? color,
      String? grade,
      List<String>? usersWhoCompleted,
      List<String>? usersWhoFlashed,
      int? number,
      String? assignedArea}) {
    if (id != null) {
      _id = id;
    }
    if (color != null) {
      _color = color;
    }
    if (grade != null) {
      _grade = grade;
    }
    if (usersWhoCompleted != null) {
      _usersWhoCompleted = usersWhoCompleted;
    }
    if (usersWhoFlashed != null) {
      _usersWhoFlashed = usersWhoFlashed;
    }
    if (number != null) {
      _number = number;
    }
    if (assignedArea != null) {
      _assignedArea = assignedArea;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get color => _color;
  set color(String? color) => _color = color;
  String? get grade => _grade;
  set grade(String? grade) => _grade = grade;
  List<String>? get usersWhoCompleted => _usersWhoCompleted;
  set usersWhoCompleted(List<String>? usersWhoCompleted) =>
      _usersWhoCompleted = usersWhoCompleted;
  List<String>? get usersWhoFlashed => _usersWhoFlashed;
  set usersWhoFlashed(List<String>? usersWhoFlashed) =>
      _usersWhoFlashed = usersWhoFlashed;
  int? get number => _number;
  set number(int? number) => _number = number;
  String? get assignedArea => _assignedArea;
  set assignedArea(String? assignedArea) => _assignedArea = assignedArea;

  AreaRoutes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _color = json['color'];
    _grade = json['grade'];
    _usersWhoCompleted = json['usersWhoCompleted'].cast<String>();
    _usersWhoFlashed = json['usersWhoFlashed'].cast<String>();
    _number = json['number'];
    _assignedArea = json['assignedArea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['color'] = _color;
    data['grade'] = _grade;
    data['usersWhoCompleted'] = _usersWhoCompleted;
    data['usersWhoFlashed'] = _usersWhoFlashed;
    data['number'] = _number;
    data['assignedArea'] = _assignedArea;
    return data;
  }
}
