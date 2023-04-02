class UsuarioCredenciais {
  int? id;
  String? username;
  String? email;
  String? accessToken;
  String? tokenType;

  UsuarioCredenciais({
    this.id,
    this.accessToken,
    this.email,
    this.tokenType,
    this.username,
  });

  UsuarioCredenciais.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accessToken = json['accessToken'];
    email = json['email'];
    tokenType = json['tokenType'];
    username = json['username'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accessToken'] = accessToken;
    data['email'] = email;
    data['tokenType'] = tokenType;
    data['username'] = username;

    return data;
  }
}
