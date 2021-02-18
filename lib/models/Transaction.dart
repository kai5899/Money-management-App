class Transaction {
  int id;
  String title;
  int categoryId;
  double amount;
  String icon;

  Transaction({
    this.id,
    this.title,
    this.amount,
    this.categoryId,
    this.icon,
  });

  factory Transaction.fromJson(Map<String, dynamic> map) {
    return Transaction(
      id: map["id"],
      amount: map["amount"],
      title: map["title"],
      categoryId: map["category_id"],
      icon: map["icon"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "amount": this.amount,
      "title": this.title,
      "category_id": this.categoryId,
      "icon": this.icon,
    };
  }

  @override
  String toString() {
    return "Transaction : {title : ${this.title} , id  : ${this.id} , category : ${this.categoryId} , amount : ${this.amount}} ";
  }
}
