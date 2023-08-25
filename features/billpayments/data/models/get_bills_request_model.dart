// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetBillsRequestModel {
  String userId;
  GetBillsRequestModel({
    required this.userId,
  });

  GetBillsRequestModel copyWith({
    String? userId,
  }) {
    return GetBillsRequestModel(
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
    };
  }

  factory GetBillsRequestModel.fromMap(Map<String, dynamic> map) {
    return GetBillsRequestModel(
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetBillsRequestModel.fromJson(String source) =>
      GetBillsRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetBillsRequestModel(userId: $userId)';

  @override
  bool operator ==(covariant GetBillsRequestModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId;
  }

  @override
  int get hashCode => userId.hashCode;
}
