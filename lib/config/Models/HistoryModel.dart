class HistoryModel {
  List<Operations>? operations;

  HistoryModel({this.operations});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['operations'] != null) {
      operations = <Operations>[];
      json['operations'].forEach((v) {
        operations!.add(Operations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.operations != null) {
      data['operations'] = this.operations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Operations {
  String? acceptingDate;
  String? addingTime;
  String? agentName;
  String? orderType;
  String? custoemrName;
  String? lastUpdate;
  String? ccName;
  String? operationId;
  int? orderId;
  int? id;
  int? isUpdated;
  String? type;
  String? status;

  Operations(
      {this.acceptingDate,
        this.addingTime,
        this.agentName,
        this.orderType,
        this.custoemrName,
        this.lastUpdate,
        this.ccName,
        this.operationId,
        this.orderId,
        this.id,
        this.isUpdated,
        this.type,
        this.status});

  Operations.fromJson(Map<String, dynamic> json) {
    acceptingDate = json['accepting_date'];
    addingTime = json['adding_time'];
    agentName = json['agent_name'];
    orderType = json['order_type'];
    custoemrName = json['custoemr_name'];
    lastUpdate = json['last_update'];
    ccName = json['cc_name'];
    operationId = json['operation_id'];
    orderId = json['order_id'];
    id = json['id'];
    isUpdated = json['is_updated'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['accepting_date'] = this.acceptingDate;
    data['adding_time'] = this.addingTime;
    data['agent_name'] = this.agentName;
    data['order_type'] = this.orderType;
    data['custoemr_name'] = this.custoemrName;
    data['last_update'] = this.lastUpdate;
    data['cc_name'] = this.ccName;
    data['operation_id'] = this.operationId;
    data['order_id'] = this.orderId;
    data['id'] = this.id;
    data['is_updated'] = this.isUpdated;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}