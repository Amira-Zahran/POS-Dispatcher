class OrderModel {
  List<Orders>? orders;

  OrderModel({this.orders});

  OrderModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  Address? address;
  String? status;
  String? date;
  String? updated_at;
  int? id;
  int? isUpdated;
  int? orderId;
  String? type;
  List<Items>? items;
  String? total;
  String? subtotal;
  Customer? customer;

  Orders(
      {this.address,
        this.status,
        this.date,
        this.id,
        this.isUpdated,
        this.orderId,
        this.type,
        this.items,
        this.total='0.0',
        this.subtotal='0.0',
        this.updated_at,
        this.customer});

  Orders.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    status = json['status'];
    date = json['created_at'];
    updated_at = json['updated_at'];
    id = json['id'];
    isUpdated = json['is_updated'];
    orderId = json['order_id'];
    type = json['type'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    total = json['total'];
    subtotal = json['subtotal'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['status'] = status;
    data['date'] = date;
    data['id'] = id;
    data['is_updated'] = isUpdated;
    data['order_id'] = orderId;
    data['type'] = type;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['subtotal'] = subtotal;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Address {
  String? address;
  String? area;

  Address({this.address, this.area});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['area'] = area;
    return data;
  }
}

class Items {
  int? id;
  int? orderId;
  int? itemId;
  int? quantity;
  String? totalPrice;
  int? shift;
  String? comment;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? itemName;

  Items(
      {this.id,
        this.orderId,
        this.itemId,
        this.quantity,
        this.totalPrice,
        this.shift,
        this.comment,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.itemName});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    itemId = json['item_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    shift = json['shift'];
    comment = json['comment'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'] ?? '1970-01-01T00:00:00Z';
    itemName = json['item_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['item_id'] = itemId;
    data['quantity'] = quantity;
    data['total_price'] = totalPrice;
    data['shift'] = shift;
    data['comment'] = comment;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['item_name'] = itemName;
    return data;
  }
}

class Customer {
  String? name;
  List<Phones>? phones;

  Customer({this.name, this.phones});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['Phones'] != null) {
      phones = <Phones>[];
      json['Phones'].forEach((v) {
        phones!.add(Phones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (phones != null) {
      data['Phones'] = phones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phones {
  String? phoneNumber;

  Phones({this.phoneNumber});

  Phones.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    return data;
  }
}