class TrainerModel {
  String? name;
  String? email;
  String? id;
  String? age;
  String? phone;
  String? address;
  String? carType;
  String? licenseNumber;
  String? uid;
  String? licenseImage;
  String? request;
  String? ageDriver;
  int? price;
  int? bills;
  List? hours;

  TrainerModel({
    this.email,
    this.name,
    this.phone,
    this.address,
    this.age,
    this.carType,
    this.id,
    this.licenseNumber,
    this.uid,
    this.licenseImage,
    this.request,
    this.price,
    this.ageDriver,
    this.bills,
    this.hours,
  });

  TrainerModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    age = json['age'];
    carType = json['carType'];
    id = json['id'];
    licenseNumber = json['licenseNumber'];
    uid = json['uid'];
    licenseImage = json['licenseImage'];
    request = json['request'];
    price = json['price'];
    ageDriver = json['ageDriver'];
    bills = json['bills'];
    hours = json['hours'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'age': age,
      'carType': carType,
      'id': id,
      'licenseNumber': licenseNumber,
      'uid': uid,
      'licenseImage': licenseImage,
      'request': request,
      'ageDriver': ageDriver,
      'price': price,
      'bills': bills,
      'hours': hours,
    };
  }
}
