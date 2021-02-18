class Wallet {
  double amount;
  int id;
  String title;
  String icon;

  Wallet({this.amount, this.title, this.id, this.icon});

  factory Wallet.fromJson(Map<String, dynamic> map) {
    return Wallet(
        amount: map["amount"],
        title: map["title"],
        id: map["id"],
        icon: map["icon"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id":this.id,
      "amount": this.amount,
      "icon":this.icon,
      "title" : this.title
    };
  }
}
