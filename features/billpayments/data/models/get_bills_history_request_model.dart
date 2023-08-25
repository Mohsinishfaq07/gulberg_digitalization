class GetBillsHistoryRequestModel {
  String? userId;

  GetBillsHistoryRequestModel({this.userId});

  GetBillsHistoryRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    return data;
  }
}
