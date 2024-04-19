class ProductModel {
  ProductModel({
      this.id, 
      this.accountID, 
      this.title, 
      this.price, 
      this.image,});

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    accountID = json['accountID'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }
  num? id;
  num? accountID;
  String? title;
  num? price;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['accountID'] = accountID;
    map['title'] = title;
    map['price'] = price;
    map['image'] = image;
    return map;
  }

}