class GetOtpForPaymentResponseModel {
  int? rrn;
  int? responseCode;
  String? responseDescription;
  int? responseDateTime;
  int? commissionAmount;
  int? totalAmount;
  String? hashData;
  String? xmlnsNs2;

  GetOtpForPaymentResponseModel(
      {this.rrn,
      this.responseCode,
      this.responseDescription,
      this.responseDateTime,
      this.commissionAmount,
      this.totalAmount,
      this.hashData,
      this.xmlnsNs2});

  GetOtpForPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    rrn = json['Rrn'];
    responseCode = json['ResponseCode'];
    responseDescription = json['ResponseDescription'];
    responseDateTime = json['ResponseDateTime'];
    commissionAmount = json['CommissionAmount'];
    totalAmount = json['TotalAmount'];
    hashData = json['HashData'];
    xmlnsNs2 = json['@_xmlns:ns2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Rrn'] = rrn;
    data['ResponseCode'] = responseCode;
    data['ResponseDescription'] = responseDescription;
    data['ResponseDateTime'] = responseDateTime;
    data['CommissionAmount'] = commissionAmount;
    data['TotalAmount'] = totalAmount;
    data['HashData'] = hashData;
    data['@_xmlns:ns2'] = xmlnsNs2;
    return data;
  }
}
