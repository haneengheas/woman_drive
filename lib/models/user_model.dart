class UserModel {
  String? type;
  String? request;


  UserModel({
    this.type,
    this.request,

  });

  UserModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    request = json['request'];

  }

  Map< String,dynamic > toMap(){
    return {
      'type' : type,
      'request' : request,
    };
  }
}
