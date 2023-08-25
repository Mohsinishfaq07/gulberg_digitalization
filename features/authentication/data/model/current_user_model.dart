class CurrentUserModel {
  String? msg;
  Data? data;

  CurrentUserModel({this.msg, this.data});

  CurrentUserModel.fromJson(Map<String, dynamic> json) {
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
      this.iV});

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
    return data;
  }
}

class ZindigiWallet {
  bool? linked;
  String? walletNumber;

  ZindigiWallet({this.linked, this.walletNumber});

  ZindigiWallet.fromJson(Map<String, dynamic> json) {
    linked = json['linked'];
    walletNumber = json['walletNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['linked'] = linked;
    data['walletNumber'] = walletNumber;
    return data;
  }
}
