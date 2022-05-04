class CartModel {
  String? color;
  String? title;
  String? weight;
  String? price;
  String? totalItemPrice;
  String? quantity;

  CartModel(
      {this.color,
        this.title,
        this.weight,
        this.price,
        this.totalItemPrice,
        this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    title = json['title'];
    weight = json['weight'];
    price = json['price'];
    totalItemPrice = json['total_item_price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['title'] = this.title;
    data['weight'] = this.weight;
    data['price'] = this.price;
    data['total_item_price'] = this.totalItemPrice;
    data['quantity'] = this.quantity;
    return data;
  }
}