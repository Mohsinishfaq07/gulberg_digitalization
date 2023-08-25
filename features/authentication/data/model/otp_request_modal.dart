import 'package:equatable/equatable.dart';

class OtpRequestModel extends Equatable {
  const OtpRequestModel({
    required this.mobile,
  });

  final String mobile;

  factory OtpRequestModel.fromJson(Map<String, dynamic> json) {
    return OtpRequestModel(
      mobile: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    _data['mobile'] = mobile;

    return _data;
  }

  @override
  List<Object?> get props => [
        mobile,
      ];
}
