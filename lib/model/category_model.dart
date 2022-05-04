class CategoryModel {
  String? color;
  String? title;

  CategoryModel({this.color, this.title});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['title'] = this.title;
    return data;
  }
}