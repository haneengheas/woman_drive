class DriverModel {
  String? name;
  String? email;
  String? age;
  String? phone;
  String? address;
  String ? uid;

  DriverModel({
    this.email,
    this.name,
    this.phone,
    this.address,
    this.age,
    this.uid,
  });

  DriverModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    age = json['age'];
    uid = json['uid'];
  }

  Map< String,dynamic > toMap(){
    return {
      'email' : email,
      'name' : name,
      'phone' : phone,
      'address' : address,
      'age' : age,
      'uid' : uid,


    };
  }
}
