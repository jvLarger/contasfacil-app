class Login {
  String? nmUsuario;
  String? nmSenha;

  Login({
    this.nmUsuario,
    this.nmSenha,
  });

  Login.fromJson(Map<String, dynamic> json) {
    nmUsuario = json['nmUsuario'];
    nmSenha = json['nmSenha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nmUsuario'] = nmUsuario;
    data['nmSenha'] = nmSenha;
    return data;
  }
}
