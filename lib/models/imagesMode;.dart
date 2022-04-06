class ImageModel{
  String ?headshot;
  String ?main;

  ImageModel({this.headshot,this.main});


  factory ImageModel.fromJson(Map data) {
    return ImageModel(
        headshot: data["head-shot"],
        main: data["main"],
    );
  }
}