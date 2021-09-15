import 'package:cats/data/auth/token_auth.dart';
import 'package:cats/data/models/cataas_random_cat.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cats/domain/entities/random_cat.dart';

const baseUrl = "https://cataas.com/cat?json=true";

class CataasService {
  final TokenAuth _cataasAuth;

  CataasService(this._cataasAuth);

  Future<RandomCat> getRandomCatUrl() async {
    String token = _cataasAuth.getToken();
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        //Here our parenthesis-password is used although it is not needed
        //because cataas api does not check it
      },
    );
    final bodyParsed = jsonDecode(response.body) as Map<String, dynamic>;
    final model = CataasRandomCat.fromJson(bodyParsed);
    return model.toDomain(title: token);
  }
}
