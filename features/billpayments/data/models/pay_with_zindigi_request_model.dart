class PayWithZindigiRequestModel {
  String? userId;
  String? amount;
  String? otpPin;
  List<TransactionIDList>? transactionIDList;

  PayWithZindigiRequestModel(
      {this.userId, this.amount, this.otpPin, this.transactionIDList});

  PayWithZindigiRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    amount = json['amount'];
    otpPin = json['otpPin'];
    if (json['TransactionIDList'] != null) {
      transactionIDList = <TransactionIDList>[];
      json['TransactionIDList'].forEach((v) {
        transactionIDList!.add(TransactionIDList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['amount'] = amount;
    data['otpPin'] = otpPin;
    if (transactionIDList != null) {
      data['TransactionIDList'] =
          transactionIDList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionIDList {
  String? transactionID;
  String? credit;

  TransactionIDList({this.transactionID, this.credit});

  TransactionIDList.fromJson(Map<String, dynamic> json) {
    transactionID = json['TransactionID'];
    credit = json['Credit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TransactionID'] = transactionID;
    data['Credit'] = credit;
    return data;
  }
}
