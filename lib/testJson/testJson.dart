var myMap={
  ''
};


class Person {
  String? name;
  String? city;
  int? age;
  List<Address>? address;

  Person({this.name, this.city, this.age, this.address});
  Person.fromJson(Map<String,dynamic> json){
    name=json['name'];
    age=json['age'];
    city=json['city'];
    if(json['address']!= null){
      address=<Address>[];
      (json['address'] as List).forEach((element) {
        address!.add(Address.fromJson(element));
      });
    }
  }



}

class Address{
  String? country;
  String? city;

  Address({this.country,this.city});

  Address.fromJson(Map<String,dynamic> json){
    country=json['name'];
    city=json['city'];
  }

}