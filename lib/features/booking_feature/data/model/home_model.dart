class HomeModel {
  HomeModel({
      this.slides=const[],
      this.services,});

  HomeModel.fromJson(dynamic json) {
    if (json['slides'] != null) {
      slides = [];
      json['slides'].forEach((v) {
        slides.add(Slides.fromJson(v));
      });
    }
    services = json['services'] != null ? Services.fromJson(json['services']) : null;
  }
  List<Slides> slides =[];
  Services? services;

}

class Services {
  Services({
      this.services,
      this.paginate,});

  Services.fromJson(dynamic json) {
    services = [];
    json.forEach((v) {
      services?.add(ServiceModel.fromJson(v));
    });
    // if (json['data'] != null) {
    //   services = [];
    //   json['data'].forEach((v) {
    //     services?.add(ServiceModel.fromJson(v));
    //   });
    // }
    // paginate = json['paginate'] != null ? Paginate.fromJson(json['paginate']) : null;
  }
  List<ServiceModel>? services;
  Paginate? paginate;
}

class Paginate {
  Paginate({
      this.totalItems, 
      this.countItems, 
      this.perPage, 
      this.totalPages, 
      this.currentPage, 
      this.nextPageUrl, 
      this.pervPageUrl,});

  Paginate.fromJson(dynamic json) {
    totalItems = json['total_items'];
    countItems = json['count_items'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    nextPageUrl = json['next_page_url'];
    pervPageUrl = json['perv_page_url'];
  }
  num? totalItems;
  num? countItems;
  num? perPage;
  num? totalPages;
  num? currentPage;
  String? nextPageUrl;
  String? pervPageUrl;
}

class ServiceModel {
  ServiceModel({
      this.id, 
      this.name, 
      this.price, 
      this.image,});

  ServiceModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }
  num? id;
  String? name;
  num? price;
  String? image;

}

class Slides {
  Slides({
      this.id, 
      this.image,});

  Slides.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  num? id;
  String? image;

}