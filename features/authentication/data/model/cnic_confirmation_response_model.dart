class CnicConfirmationResponseModel {
  String? msg;
  Data? data;

  CnicConfirmationResponseModel({this.msg, this.data});

  CnicConfirmationResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? memberName;
  String? phone;
  String? cNIC;
  List<Inventory>? inventory;

  Data({this.memberName, this.phone, this.cNIC, this.inventory});

  Data.fromJson(Map<String, dynamic> json) {
    memberName = json['MemberName'];
    phone = (json['Phone'].substring(0, 3) == "920")
        ? json['Phone'].replaceFirst("920", "92").replaceFirst("-", "")
        : json['Phone'];
    cNIC = json['CNIC'];
    if (json['Inventory'] != null) {
      inventory = <Inventory>[];
      json['Inventory'].forEach((v) {
        inventory!.add(Inventory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MemberName'] = memberName;
    data['Phone'] = phone;
    data['CNIC'] = cNIC;
    if (inventory != null) {
      data['Inventory'] = inventory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inventory {
  String? phaseID;
  String? plotNo;
  String? blockID;
  String? street;

  Inventory({this.phaseID, this.plotNo, this.blockID, this.street});

  Inventory.fromJson(Map<String, dynamic> json) {
    phaseID = json['PhaseID'];
    plotNo = json['PlotNo'];
    blockID = json['BlockID'];
    street = json['Street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PhaseID'] = phaseID;
    data['PlotNo'] = plotNo;
    data['BlockID'] = blockID;
    data['Street'] = street;
    return data;
  }
}
