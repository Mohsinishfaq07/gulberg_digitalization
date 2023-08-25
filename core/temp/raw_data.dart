// List<BillDetailModel> tempBillList = [
//   BillDetailModel(
//       amount: 40000,
//       billType: "maintainance",
//       billId: "541321",
//       membershipNo: "5654",
//       plotOrHouseNo: "54643",
//       streetNo: "2",
//       blockNo: "2",
//       date: DateTime.now().toIso8601String(),
//       phase: "GR"),
//   BillDetailModel(
//       amount: 80000,
//       billType: "maintainance",
//       billId: "541321",
//       membershipNo: "5654",
//       plotOrHouseNo: "54643",
//       streetNo: "2",
//       blockNo: "2",
//       date: DateTime.now().toIso8601String(),
//       phase: "GR"),
// ];
import 'package:sb_myreports/core/temp/temp_classes.dart';

List<TransactionDetailModel> tempTansactionList = [
  TransactionDetailModel(
      date: DateTime.now().toIso8601String(),
      transactionId: "5564564564",
      amount: 4000,
      paymentMethod: "Bill Pay",
      feeCharges: 0.0),
  TransactionDetailModel(
      date: DateTime.now().toIso8601String(),
      transactionId: "5564564564",
      amount: 4000,
      paymentMethod: "Bill Pay",
      feeCharges: 0.0),
];
