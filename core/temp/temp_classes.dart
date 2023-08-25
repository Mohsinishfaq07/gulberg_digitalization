// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class BillDetailModel {
//   double amount;
//   String billType;
//   String billId;
//   String membershipNo;
//   String plotOrHouseNo;
//   String streetNo;
//   String blockNo;
//   String phase;
//   String date;
//   BillDetailModel({
//     required this.amount,
//     required this.billType,
//     required this.billId,
//     required this.membershipNo,
//     required this.plotOrHouseNo,
//     required this.streetNo,
//     required this.blockNo,
//     required this.phase,
//     required this.date,
//   });
// }

class TransactionDetailModel {
  String date;
  String transactionId;
  double amount;
  String paymentMethod;
  double feeCharges;
  TransactionDetailModel({
    required this.date,
    required this.transactionId,
    required this.amount,
    required this.paymentMethod,
    required this.feeCharges,
  });
}
