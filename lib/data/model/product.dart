class Product {
  int? _totalSize;
  int? get totalSize => _totalSize;

  int? _typeId;
  int? get typeId => _typeId;

  int? _offset;
  int? get offset => _offset;

  late List<Products> _products;
  List<Products> get products => _products;



  Product({required totalSize, required typeId, required offset, required products}) {
    _totalSize = totalSize;
    _typeId = typeId;
    _offset = offset;
    _products = products;
  }

  Product.fromJson(dynamic json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products =<Products> [];
      json['products'].forEach((v) {
        _products.add(Products.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_size'] = _totalSize;
    map['type_id'] = _typeId;
    map['offset'] = _offset;
    if (_products != null) {
      map['products'] = _products.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Products {
  Products({
    int? id,
    String? name,
    String? description,
    int? price,
    int? stars,
    String? img,
    String? location,
    String? createdAt,
    String? updatedAt,
    int? typeId,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _stars = stars;
    _img = img;
    _location = location;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _typeId = typeId;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _stars = json['stars'];
    _img = json['img'];
    _location = json['location'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _typeId = json['type_id'];
  }

  int? _id;
  String? _name;
  String? _description;
  int? _price;
  int? _stars;
  String? _img;
  String? _location;
  String? _createdAt;
  String? _updatedAt;
  int? _typeId;

  int? get id => _id;

  String? get name => _name;

  String? get description => _description;

  int? get price => _price;

  int? get stars => _stars;

  String? get img => _img;

  String? get location => _location;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get typeId => _typeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['stars'] = _stars;
    map['img'] = _img;
    map['location'] = _location;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['type_id'] = _typeId;
    return map;
  }
}
