class SetPinResponseModel {
  String? msg;

  SetPinResponseModel({this.msg});

  SetPinResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    return data;
  }
}
