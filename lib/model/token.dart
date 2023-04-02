class Token {
  String? accessToken;
  bool? isTokenValido;

  Token({
    this.accessToken,
    this.isTokenValido,
  });

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    isTokenValido = json['isTokenValido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['isTokenValido'] = isTokenValido;
    return data;
  }
}
