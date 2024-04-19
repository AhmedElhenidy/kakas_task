class BookingModel {
  BookingModel({
      this.orderId, 
      this.day, 
      this.barber, 
      this.time, 
      this.service=const[],
      this.price,});

  BookingModel.fromJson(dynamic json) {
    orderId = json['order_id'];
    day = json['day'];
    barber = json['barber'];
    time = json['time'];
    service = json['service'] != null ? json['service'].cast<String>() : [];
    price = json['price'];
  }
  num? orderId;
  String? day;
  String? barber;
  String? time;
  List<String> service=[];
  num? price;
}