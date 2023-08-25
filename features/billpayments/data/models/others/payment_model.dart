// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentModel {
  String userId;
  List<BillDetails> billDetails;
  PaymentModel({
    required this.userId,
    required this.billDetails,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': userId,
      'billDetails': billDetails.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}

class BillDetails {
  String transactionId;
  String credit;
  BillDetails({
    required this.transactionId,
    required this.credit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TransactionID': transactionId,
      'Credit': credit,
    };
  }

  String toJson() => json.encode(toMap());
}
