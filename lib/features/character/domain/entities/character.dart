class Character {
  Character({
    required this.name,
    required this.images,
    required this.gender,
    required this.species,
    required this.homePlanet,
    required this.occupation,
    required this.sayings,
    required this.id,
    required this.age,
  });
  late final Name name;
  late final Images images;
  late final String gender;
  late final String species;
  late final String homePlanet;
  late final String occupation;
  late final List<String> sayings;
  late final int id;
  late final String age;
  
  Character.fromJson(Map<String, dynamic> json){
    name = Name.fromJson(json['name']);
    images = Images.fromJson(json['images']);
    gender = json['gender'];
    species = json['species'];
    homePlanet = json['homePlanet'] ?? "N/A";
    occupation = json['occupation'] ??  "N/A";
    sayings = List.castFrom<dynamic, String>(json['sayings']);
    id = json['id'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name.toJson();
    _data['images'] = images.toJson();
    _data['gender'] = gender;
    _data['species'] = species;
    _data['homePlanet'] = homePlanet;
    _data['occupation'] = occupation;
    _data['sayings'] = sayings;
    _data['id'] = id;
    _data['age'] = age;
    return _data;
  }
}

class Name {
  Name({
    required this.first,
    required this.middle,
    required this.last,
  });
  late final String first;
  late final String middle;
  late final String last;
  
  Name.fromJson(Map<String, dynamic> json){
    first = json['first'];
    middle = json['middle'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first'] = first;
    _data['middle'] = middle;
    _data['last'] = last;
    return _data;
  }

  @override
  String toString() {
    return first.trim() +" "+middle.trim()+" "+last.trim();
  }
}

class Images {
  Images({
    required this.headShot,
    required this.main,
  });
  late final String headShot;
  late final String main;
  
  Images.fromJson(Map<String, dynamic> json){
    headShot = json['head-shot'];
    main = json['main'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['head-shot'] =headShot;
    _data['main'] = main;
    return _data;
  }
}