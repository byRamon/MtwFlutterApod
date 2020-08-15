class ApodImage {
  String date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String title;
  String url;
  String copyright;

  ApodImage({
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
    this.copyright,
  });

  ApodImage.fromJsonMap(Map<String,dynamic> json){
    this.date = json['date'];
    this.explanation = json['explanation'];
    this.hdurl = json['hdurl'];
    this.mediaType = json['media_type'];
    this.serviceVersion = json['service_version'];
    this.title = json['title'];
    this.url = json['url'];
    this.copyright = json['copyright'];
  }
}

class ApodList{
  List<ApodImage> items = List();
  ApodList();
  ApodList.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      items.add(ApodImage.fromJsonMap(item));
    }
  }
}