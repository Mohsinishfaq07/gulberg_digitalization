// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDetailModel {
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
  UserDetailModel({
    this.phaseID,
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
  });

  UserDetailModel copyWith({
    String? phaseID,
    String? plotNo,
    String? blockID,
    String? street,
    String? unitTypeID,
    String? unitSize,
    String? inventoryTitle,
    String? plotStatus,
    String? allocated,
    String? exemptToBill,
    String? dimensions,
    String? area,
    String? drawingSubmission,
    String? drawingApproval,
    String? lastModifiedBy,
    String? lastModifiedDate,
    String? memberID,
  }) {
    return UserDetailModel(
      phaseID: phaseID ?? this.phaseID,
      plotNo: plotNo ?? this.plotNo,
      blockID: blockID ?? this.blockID,
      street: street ?? this.street,
      unitTypeID: unitTypeID ?? this.unitTypeID,
      unitSize: unitSize ?? this.unitSize,
      inventoryTitle: inventoryTitle ?? this.inventoryTitle,
      plotStatus: plotStatus ?? this.plotStatus,
      allocated: allocated ?? this.allocated,
      exemptToBill: exemptToBill ?? this.exemptToBill,
      dimensions: dimensions ?? this.dimensions,
      area: area ?? this.area,
      drawingSubmission: drawingSubmission ?? this.drawingSubmission,
      drawingApproval: drawingApproval ?? this.drawingApproval,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
      lastModifiedDate: lastModifiedDate ?? this.lastModifiedDate,
      memberID: memberID ?? this.memberID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phaseID': phaseID,
      'plotNo': plotNo,
      'blockID': blockID,
      'street': street,
      'unitTypeID': unitTypeID,
      'unitSize': unitSize,
      'inventoryTitle': inventoryTitle,
      'plotStatus': plotStatus,
      'allocated': allocated,
      'exemptToBill': exemptToBill,
      'dimensions': dimensions,
      'area': area,
      'drawingSubmission': drawingSubmission,
      'drawingApproval': drawingApproval,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedDate': lastModifiedDate,
      'memberID': memberID,
    };
  }

  UserDetailModel.fromMap(Map<String, dynamic> json) {
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
  }

  String toJson() => json.encode(toMap());

  factory UserDetailModel.fromJson(String source) =>
      UserDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDetailModel(phaseID: $phaseID, plotNo: $plotNo, blockID: $blockID, street: $street, unitTypeID: $unitTypeID, unitSize: $unitSize, inventoryTitle: $inventoryTitle, plotStatus: $plotStatus, allocated: $allocated, exemptToBill: $exemptToBill, dimensions: $dimensions, area: $area, drawingSubmission: $drawingSubmission, drawingApproval: $drawingApproval, lastModifiedBy: $lastModifiedBy, lastModifiedDate: $lastModifiedDate, memberID: $memberID)';
  }

  @override
  bool operator ==(covariant UserDetailModel other) {
    if (identical(this, other)) return true;

    return other.phaseID == phaseID &&
        other.plotNo == plotNo &&
        other.blockID == blockID &&
        other.street == street &&
        other.unitTypeID == unitTypeID &&
        other.unitSize == unitSize &&
        other.inventoryTitle == inventoryTitle &&
        other.plotStatus == plotStatus &&
        other.allocated == allocated &&
        other.exemptToBill == exemptToBill &&
        other.dimensions == dimensions &&
        other.area == area &&
        other.drawingSubmission == drawingSubmission &&
        other.drawingApproval == drawingApproval &&
        other.lastModifiedBy == lastModifiedBy &&
        other.lastModifiedDate == lastModifiedDate &&
        other.memberID == memberID;
  }

  @override
  int get hashCode {
    return phaseID.hashCode ^
        plotNo.hashCode ^
        blockID.hashCode ^
        street.hashCode ^
        unitTypeID.hashCode ^
        unitSize.hashCode ^
        inventoryTitle.hashCode ^
        plotStatus.hashCode ^
        allocated.hashCode ^
        exemptToBill.hashCode ^
        dimensions.hashCode ^
        area.hashCode ^
        drawingSubmission.hashCode ^
        drawingApproval.hashCode ^
        lastModifiedBy.hashCode ^
        lastModifiedDate.hashCode ^
        memberID.hashCode;
  }
}
