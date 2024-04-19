class BarberModel {
  BarberModel({
      this.id, 
      this.name, 
      this.image,});

  BarberModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;
}