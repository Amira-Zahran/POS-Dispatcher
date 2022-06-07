class deliveryAgent {
  List<Agents>? agents;

  deliveryAgent({this.agents});

  deliveryAgent.fromJson(Map<String, dynamic> json) {
    if (json['agents'] != null) {
      agents = <Agents>[];
      json['agents'].forEach((v) {
        agents!.add(Agents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (agents != null) {
      data['agents'] = agents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Agents {
  int? id;
  String? name;
  String? phoneNumber;
  int? branch;
  String? createdAt;
  String? updatedAt;

  Agents(
      {this.id,
        this.name,
        this.phoneNumber,
        this.branch,
        this.createdAt,
        this.updatedAt});

  Agents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    branch = json['branch'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['branch'] = branch;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}