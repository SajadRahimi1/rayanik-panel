
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["category"] = category;
    data["price"] = price;
    data["weeksCount"] = weeksCount;
    data["imageUrl"] = imageUrl;
    if(lessons != null) {
      data["lessons"] = lessons?.map((e) => e.toJson()).toList();
    }
    data["Id"] = id;
    data["CreatedAt"] = createdAt;
    data["UpdatedAt"] = updatedAt;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["courseId"] = courseId;
    data["title"] = title;
    data["description"] = description;
    data["imageUrl"] = imageUrl;
    data["videoUrl"] = videoUrl;
    data["weekNumber"] = weekNumber;
    data["Id"] = id;
    data["CreatedAt"] = createdAt;
    data["UpdatedAt"] = updatedAt;
    return data;
  }
}