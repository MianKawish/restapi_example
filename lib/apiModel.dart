class RestApi {
  int? userId;
  int? id;
  String? title;
  String? body;

  RestApi({this.userId, this.id, this.title, this.body});

  RestApi.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
