class LoginUserRequestModel {
  String? mobile;
  String? pIN;

  LoginUserRequestModel({this.mobile, this.pIN});

  LoginUserRequestModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    pIN = json['PIN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['PIN'] = pIN;
    return data;
  }
}
