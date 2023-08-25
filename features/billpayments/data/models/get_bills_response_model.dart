class GetBillsResponseModel {
  String? msg;
  List<Data>? data;

  GetBillsResponseModel({this.msg, this.data});

  GetBillsResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? phaseID;
  String? plotNo;
  String? blockID;
  String? street;
  String? unitTypeID;
  String? unitSize;
  String? inventoryTitle;
  String? plotStatus;
  String? allocated;
  String? exemptToBill;
  String? dimensions;
  String? area;
  String? drawingSubmission;
  String? drawingApproval;
  String? lastModifiedBy;
  String? lastModifiedDate;
  String? memberID;
  List<TransactionList>? transactionList;

  Data(
      {this.phaseID,
      this.plotNo,
      this.blockID,
      this.street,
      this.unitTypeID,
      this.unitSize,
      this.inventoryTitle,
      this.plotStatus,
      this.allocated,
      this.exemptToBill,
      this.dimensions,
      this.area,
      this.drawingSubmission,
      this.drawingApproval,
      this.lastModifiedBy,
      this.lastModifiedDate,
      this.memberID,
      this.transactionList});

  Data.fromJson(Map<String, dynamic> json) {
    phaseID = json['PhaseID'];
    plotNo = json['PlotNo'];
    blockID = json['BlockID'];
    street = json['Street'];
    unitTypeID = json['UnitTypeID'];
    unitSize = json['UnitSize'];
    inventoryTitle = json['InventoryTitle'];
    plotStatus = json['PlotStatus'];
    allocated = json['Allocated'];
    exemptToBill = json['ExemptToBill'];
    dimensions = json['Dimensions'];
    area = json['Area'];
    drawingSubmission = json['DrawingSubmission'];
    drawingApproval = json['DrawingApproval'];
    lastModifiedBy = json['LastModifiedBy'];
    lastModifiedDate = json['LastModifiedDate'];
    memberID = json['MemberID'];
    if (json['transactionList'] != null) {
      transactionList = <TransactionList>[];
      json['transactionList'].forEach((v) {
        transactionList!.add(TransactionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PhaseID'] = phaseID;
    data['PlotNo'] = plotNo;
    data['BlockID'] = blockID;
    data['Street'] = street;
    data['UnitTypeID'] = unitTypeID;
    data['UnitSize'] = unitSize;
    data['InventoryTitle'] = inventoryTitle;
    data['PlotStatus'] = plotStatus;
    data['Allocated'] = allocated;
    data['ExemptToBill'] = exemptToBill;
    data['Dimensions'] = dimensions;
    data['Area'] = area;
    data['DrawingSubmission'] = drawingSubmission;
    data['DrawingApproval'] = drawingApproval;
    data['LastModifiedBy'] = lastModifiedBy;
    data['LastModifiedDate'] = lastModifiedDate;
    data['MemberID'] = memberID;
    if (transactionList != null) {
      data['transactionList'] =
          transactionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransactionList {
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

  TransactionList(
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

  TransactionList.fromJson(Map<String, dynamic> json) {
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
