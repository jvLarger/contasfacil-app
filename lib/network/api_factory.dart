// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:contasfacil/model/login.dart';
import 'package:contasfacil/model/token.dart';
import 'package:http/http.dart' as http;

class ApiFactory {
  static const String API_BASE_URL = "http://192.168.0.103:8080/api";
  static String TOKEN_JWT = "";

  static Map<String, String> REQUEST_HEADERS = {
    "Content-type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $TOKEN_JWT"
  };

  Uri getUri(String path) {
    return Uri.parse("$API_BASE_URL/$path");
  }

  isTokenJWTAtivo(Token token) async {
    return await http.post(
      getUri("auth/token-valido"),
      headers: REQUEST_HEADERS,
      body: json.encode(token),
    );
  }

  login(Login login) async {
    return await http.post(
      getUri("auth/signin"),
      headers: REQUEST_HEADERS,
      body: json.encode(login),
    );
  }
}
