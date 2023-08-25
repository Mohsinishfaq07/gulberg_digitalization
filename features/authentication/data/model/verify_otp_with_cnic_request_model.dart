class VerifyOtpWithCnicRequestModel {
  String? cnic;
  String? otp;

  VerifyOtpWithCnicRequestModel({this.cnic, this.otp});

  VerifyOtpWithCnicRequestModel.fromJson(Map<String, dynamic> json) {
    cnic = json['cnic'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cnic'] = cnic;
    data['otp'] = otp;
    return data;
  }
}
