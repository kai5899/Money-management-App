class Category {
  int id;
  String title;
  int color;

  Category({this.id, this.title, this.color});

  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      id: map["id"],
      title: map["title"],
      color: map["color"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "color": this.color,
    };
  }

  @override
  String toString() {
    return "Category : {title : ${this.title} , id : ${this.id}}";
  }
}
