class GetBillsHistoryResponseModel {
  String? msg;
  List<Data>? data;

  GetBillsHistoryResponseModel({this.msg, this.data});

  GetBillsHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  BillDetails? billDetails;
  String? method;
  String? createdAt;

  Data({this.sId, this.billDetails, this.method, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    billDetails = json['billDetails'] != null
        ? BillDetails.fromJson(json['billDetails'])
        : null;
    method = json['method'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (billDetails != null) {
      data['billDetails'] = billDetails!.toJson();
    }
    data['method'] = method;
    data['createdAt'] = createdAt;
    return data;
  }
}

class BillDetails {
  int? plotID;
  int? trID;
  String? issueDate;
  String? billingMonth;
  String? residentName;
  String? plotNo;
  String? street;
  String? blockName;
  String? conactfunc;
  int? phaseID;
  int? blockID;
  String? unitType;
  String? unitSize;
  String? projectName;
  int? serviceCharges;
  int? salesTax;
  int? totalAmount;
  int? amountWithinDueDate;
  int? dueDateSurcharge;
  int? amountAfterDueDate;
  int? arrears;
  int? adjustmentBalance;
  int? maintenanceCharges;

  BillDetails(
      {this.plotID,
      this.trID,
      this.issueDate,
      this.billingMonth,
      this.residentName,
      this.plotNo,
      this.street,
      this.blockName,
      this.conactfunc,
      this.phaseID,
      this.blockID,
      this.unitType,
      this.unitSize,
      this.projectName,
      this.serviceCharges,
      this.salesTax,
      this.totalAmount,
      this.amountWithinDueDate,
      this.dueDateSurcharge,
      this.amountAfterDueDate,
      this.arrears,
      this.adjustmentBalance,
      this.maintenanceCharges});

  BillDetails.fromJson(Map<String, dynamic> json) {
    plotID = json['PlotID'];
    trID = json['Tr_ID'];
    issueDate = json['IssueDate'];
    billingMonth = json['BillingMonth'];
    residentName = json['ResidentName'];
    plotNo = json['PlotNo'];
    street = json['Street'];
    blockName = json['BlockName'];
    conactfunc = json['Conactfunc'];
    phaseID = json['PhaseID'];
    blockID = json['BlockID'];
    unitType = json['UnitType'];
    unitSize = json['UnitSize'];
    projectName = json['ProjectName'];
    serviceCharges = json['ServiceCharges'];
    salesTax = json['SalesTax'];
    totalAmount = json['TotalAmount'];
    amountWithinDueDate = json['AmountWithinDueDate'];
    dueDateSurcharge = json['DueDateSurcharge'];
    amountAfterDueDate = json['AmountAfterDueDate'];
    arrears = json['Arrears'];
    adjustmentBalance = json['AdjustmentBalance'];
    maintenanceCharges = json['MaintenanceCharges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PlotID'] = plotID;
    data['Tr_ID'] = trID;
    data['IssueDate'] = issueDate;
    data['BillingMonth'] = billingMonth;
    data['ResidentName'] = residentName;
    data['PlotNo'] = plotNo;
    data['Street'] = street;
    data['BlockName'] = blockName;
    data['Conactfunc'] = conactfunc;
    data['PhaseID'] = phaseID;
    data['BlockID'] = blockID;
    data['UnitType'] = unitType;
    data['UnitSize'] = unitSize;
    data['ProjectName'] = projectName;
    data['ServiceCharges'] = serviceCharges;
    data['SalesTax'] = salesTax;
    data['TotalAmount'] = totalAmount;
    data['AmountWithinDueDate'] = amountWithinDueDate;
    data['DueDateSurcharge'] = dueDateSurcharge;
    data['AmountAfterDueDate'] = amountAfterDueDate;
    data['Arrears'] = arrears;
    data['AdjustmentBalance'] = adjustmentBalance;
    data['MaintenanceCharges'] = maintenanceCharges;
    return data;
  }
}
