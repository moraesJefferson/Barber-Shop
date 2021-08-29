import 'package:barber_shop/app/database/entity/result_cep.dart';
import 'package:http/http.dart' as http;

class ViaCepService {
  static ViaCepService _instance;

  static ViaCepService getInstance() {
    if (_instance == null) {
      _instance = ViaCepService();
    }
    return _instance;
  }

  Future<ResultCep> fetchCep({String cep}) async {
    Uri uri = Uri.https(
      'viacep.com.br',
      '/ws/$cep/json/',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return ResultCep.fromJson(response.body);
    } else {
      throw Exception('Requisição inválida!');
    }
  }
}
