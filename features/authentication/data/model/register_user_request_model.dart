class RegisterUserRequestModel {
  String? name;
  String? cNIC;
  String? mobile;

  RegisterUserRequestModel({this.name, this.cNIC, this.mobile});

  RegisterUserRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cNIC = json['CNIC'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['CNIC'] = cNIC;
    data['mobile'] = mobile;
    return data;
  }
}
