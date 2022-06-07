class User {
    String? email;
    String? name;
    String? token;
    String? type;

    User({this.email, this.name, this.token, this.type});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            email: json['email'],
            name: json['name'],
            token: json['token'],
            type: json['type'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['email'] = this.email;
        data['name'] = this.name;
        data['token'] = this.token;
        data['type'] = this.type;
        return data;
    }
}