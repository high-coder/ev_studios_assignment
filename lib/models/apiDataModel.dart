import 'imagesMode;.dart';
import 'nameModel.dart';

class ApiDataModel{
  NameModel ?nameData;
  ImageModel ?images;
  String ?gender;
  String ?species;
  String ?homePlanet;
  String ?occupation;
  List ?sayings;
  int ?id;
  String ?age;



  ApiDataModel(
    {
      this.id,
      this.age,
      this.gender,
      this.homePlanet,
      this.images,
      this.nameData,
      this.occupation,
      this.sayings,
      this.species
    }
  );


  factory ApiDataModel.fromJson(Map data) {
    return ApiDataModel(
      nameData: data["name"]!=null ? NameModel.fromJson(data["name"]) : null,
      images: data["images"]!=null ? ImageModel.fromJson(data["images"]) : null,
      gender: data["gender"],
      species: data["species"],
      homePlanet: data["homePlanet"],
      occupation: data["occupation"],
      sayings: data["sayings"],
      id:data["id"],
      age: data["age"],

    );
  }
}