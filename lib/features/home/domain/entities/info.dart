class Info {
  String? _synopsis;
  String? _yearsAired;
  List<Creators>? _creators;
  int? _id;

  Info({String? synopsis, String? yearsAired, List<Creators>? creators, int? id}) {
    this._synopsis = synopsis;
    this._yearsAired = yearsAired;
    this._creators = creators;
    this._id = id;
  }

  String get synopsis => _synopsis!;
  set synopsis(String synopsis) => _synopsis = synopsis;
  String get yearsAired => _yearsAired!;
  set yearsAired(String yearsAired) => _yearsAired = yearsAired;
  List<Creators> get creators => _creators!;
  set creators(List<Creators> creators) => _creators = creators;
  int get id => _id!;
  set id(int id) => _id = id;

 
}

class Creators {
  String? _name;
  String? _url;

  Creators({String? name, String? url}) {
    this._name = name;
    this._url = url;
  }

  String get name => _name!;
  set name(String name) => _name = name;
  String get url => _url!;
  set url(String url) => _url = url;

  toJson() {}


}