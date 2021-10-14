/// id : "2711537"
/// name : "Gothenburg"
/// country : "SE"

class BaseClass {
  BaseClass(
      String id,
      String name,
      String country,){
    _id = id;
    _name = name;
    _country = country;
}

  BaseClass.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _country = json['country'];
  }
  late String _id;
  late String _name;
  late  String _country;

  String get id => _id;
  String get name => _name;
  String get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['country'] = _country;
    return map;
  }

  @override
  String toString() {
    return 'BaseClass{_id: $_id, _name: $_name, _country: $_country}';
  }
}