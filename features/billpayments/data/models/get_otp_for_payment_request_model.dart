class GetOtpForPaymentRequestModel {
  String? userId;
  String? amount;

  GetOtpForPaymentRequestModel({this.userId, this.amount});

  GetOtpForPaymentRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['amount'] = amount;
    return data;
  }
}
