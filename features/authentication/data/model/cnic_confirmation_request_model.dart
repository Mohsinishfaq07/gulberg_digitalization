import 'package:equatable/equatable.dart';

class CnicConfirmationRequestModel extends Equatable {
  const CnicConfirmationRequestModel({
    required this.cnicNo,
  });

  final String cnicNo;

  factory CnicConfirmationRequestModel.fromJson(Map<String, dynamic> json) {
    return CnicConfirmationRequestModel(
      cnicNo: json['CNIC'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> _data = {};
    _data['CNIC'] = cnicNo;

    return _data;
  }

  @override
  List<Object?> get props => [
        cnicNo,
      ];
}
