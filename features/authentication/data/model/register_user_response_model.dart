class RegisterUserResponseModel {
  String? msg;
  Data? data;

  RegisterUserResponseModel({this.msg, this.data});

  RegisterUserResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? cNIC;
  String? mobile;
  bool? verified;
  bool? pINSet;
  ZindigiWallet? zindigiWallet;
  String? token;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;
  bool? isZindigi;

  Data(
      {this.name,
      this.cNIC,
      this.mobile,
      this.verified,
      this.pINSet,
      this.zindigiWallet,
      this.token,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.isZindigi});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cNIC = json['CNIC'];
    mobile = json['mobile'];
    verified = json['verified'];
    pINSet = json['PINSet'];
    zindigiWallet = json['zindigiWallet'] != null
        ? ZindigiWallet.fromJson(json['zindigiWallet'])
        : null;
    token = json['token'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    isZindigi = json['isZindigi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['CNIC'] = cNIC;
    data['mobile'] = mobile;
    data['verified'] = verified;
    data['PINSet'] = pINSet;
    if (zindigiWallet != null) {
      data['zindigiWallet'] = zindigiWallet!.toJson();
    }
    data['token'] = token;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['isZindigi'] = isZindigi;
    return data;
  }
}

class ZindigiWallet {
  bool? linked;
  String? walletNumber;
  String? title;

  ZindigiWallet({this.linked, this.walletNumber, this.title});

  ZindigiWallet.fromJson(Map<String, dynamic> json) {
    linked = json['linked'];
    walletNumber = json['walletNumber'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['linked'] = linked;
    data['walletNumber'] = walletNumber;
    data['title'] = title;
    return data;
  }
}
