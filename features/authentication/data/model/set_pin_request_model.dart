class SetPinRequestModel {
  String? mobile;
  String? pIN;

  SetPinRequestModel({this.mobile, this.pIN});

  SetPinRequestModel.fromJson(Map<String, dynamic> json) {
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
