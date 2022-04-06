

import '../../domain/entities/info.dart';
class InfoModel extends Info{


      InfoModel({String? synopsis, String? yearsAired, List<Creators>? creators, int? id}): super(id: id , creators: creators,synopsis: synopsis,yearsAired: yearsAired);


      factory InfoModel.fromJson(Map<String, dynamic> json) {

       
          late List<Creators> creators;

            if (json['creators'] != null) {
              creators = <Creators>[];
          
              json['creators'].forEach((v) {
               creators.add(CreatorsModel.fromJson(v));
              });
            }

        return  InfoModel(synopsis:  json['synopsis'] ,yearsAired:  json['yearsAired'] , id: json['id'] , creators: creators);
  
     }
 
      Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['synopsis'] = synopsis;
        data['yearsAired'] = yearsAired;
        if (creators != null) {
          data['creators'] = creators.map((v) => v.toJson()).toList();
        }
        data['id'] =id;
        return data;
      }
}

class CreatorsModel extends Creators{

CreatorsModel({String? name, String? url}):super(name: name,url: url);

    factory CreatorsModel.fromJson(Map<String, dynamic> json) {

      return CreatorsModel(name:  json['name'] , url: json['url']);
    }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

