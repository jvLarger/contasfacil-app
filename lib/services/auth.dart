import 'dart:convert';

import 'package:contasfacil/model/login.dart';
import 'package:contasfacil/model/standard_error.dart';
import 'package:contasfacil/model/token.dart';
import 'package:contasfacil/model/usuario.dart';
import 'package:contasfacil/network/api_factory.dart';
import 'package:contasfacil/util/business_exception.dart';
import 'package:http/http.dart';

class Auth {

  Future<bool> isTokenJWTAtivo() async {
    if (ApiFactory.TOKEN_JWT.isEmpty) {
      return false;
    } else {

      Response response = await ApiFactory().isTokenJWTAtivo(Token(accessToken: ApiFactory.TOKEN_JWT));

      if (response.statusCode == 200) {
        Token token = Token.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return token.isTokenValido!;
      } else {
        return false;
      }

    }
  }

  login(Login login) async {

    if (login.nmUsuario!.isEmpty) {
      throw BusinessException("Nome de Usuário não informado!");
    }

    if (login.nmSenha!.isEmpty) {
      throw BusinessException("Senha não informada!");
    }

    Response? response = await ApiFactory().login(login);

    if (response == null || response.statusCode == 401) {
       StandardError standardError = StandardError.fromJson(jsonDecode(response!.body));
       throw BusinessException(standardError.message!);
    } else {

      UsuarioCredenciais usuarioCredenciais = UsuarioCredenciais.fromJson(jsonDecode(response.body));

      ApiFactory.TOKEN_JWT = usuarioCredenciais.accessToken!;
    
    }
  }
}
