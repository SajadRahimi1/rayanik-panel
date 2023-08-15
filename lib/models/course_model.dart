
class CourseModel {
  String? title;
  String? category;
  dynamic price;
  int? weeksCount;
  String? imageUrl;
  List<Lessons>? lessons;
  String? id;
  String? createdAt;
  String? updatedAt;

  CourseModel({this.title, this.category, this.price, this.weeksCount, this.imageUrl, this.lessons, this.id, this.createdAt, this.updatedAt});

  CourseModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    category = json["category"];
    price = json["price"];
    weeksCount = json["weeksCount"];
    imageUrl = json["imageUrl"];
     lessons = json["lessons"] == null ? null : (json["lessons"] as List).map((e) => Lessons.fromJson(e)).toList();
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["category"] = category;
    _data["price"] = price;
    _data["weeksCount"] = weeksCount;
    _data["imageUrl"] = imageUrl;
    if(lessons != null) {
      _data["lessons"] = lessons?.map((e) => e.toJson()).toList();
    }
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}


class Lessons {
  String? courseId;
  String? title;
  dynamic description;
  String? imageUrl;
  String? videoUrl;
  int? weekNumber;
  String? id;
  String? createdAt;
  String? updatedAt;

  Lessons({this.courseId, this.title, this.description, this.imageUrl, this.videoUrl, this.weekNumber, this.id, this.createdAt, this.updatedAt});

  Lessons.fromJson(Map<String, dynamic> json) {
    courseId = json["courseId"];
    title = json["title"];
    description = json["description"];
    imageUrl = json["imageUrl"];
    videoUrl = json["videoUrl"];
    weekNumber = json["weekNumber"];
    id = json["Id"];
    createdAt = json["CreatedAt"];
    updatedAt = json["UpdatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["courseId"] = courseId;
    _data["title"] = title;
    _data["description"] = description;
    _data["imageUrl"] = imageUrl;
    _data["videoUrl"] = videoUrl;
    _data["weekNumber"] = weekNumber;
    _data["Id"] = id;
    _data["CreatedAt"] = createdAt;
    _data["UpdatedAt"] = updatedAt;
    return _data;
  }
}