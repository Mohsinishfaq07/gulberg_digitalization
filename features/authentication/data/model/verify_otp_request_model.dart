// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VerifyOtpRequestModel {
  String mobile;
  String otp;
  VerifyOtpRequestModel({
    required this.mobile,
    required this.otp,
  });

  VerifyOtpRequestModel copyWith({
    String? mobile,
    String? otp,
    String? cnic,
  }) {
    return VerifyOtpRequestModel(
      mobile: mobile ?? this.mobile,
      otp: otp ?? this.otp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mobile': mobile,
      'OTP': otp,
    };
  }

  factory VerifyOtpRequestModel.fromMap(Map<String, dynamic> map) {
    return VerifyOtpRequestModel(
      mobile: map['mobile'] as String,
      otp: map['otp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpRequestModel.fromJson(String source) =>
      VerifyOtpRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VerifyOtpRequestModel(mobile: $mobile, otp: $otp)';

  @override
  bool operator ==(covariant VerifyOtpRequestModel other) {
    if (identical(this, other)) return true;

    return other.mobile == mobile && other.otp == otp;
  }

  @override
  int get hashCode => mobile.hashCode ^ otp.hashCode;
}
