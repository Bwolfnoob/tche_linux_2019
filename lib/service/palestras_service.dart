import 'package:tche_linux_caxias_do_sul/pages/model/palestra.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as Json;
import 'package:rxdart/rxdart.dart';

class PalestraService {
  Dio _dio;

  PalestraService() {
    _dio = Dio();
    _palestras().then((palestras) => _controller.add(palestras));
  }

  var _controller = BehaviorSubject<List<Palestra>>();

  Observable<List<Palestra>> get palestras => _controller.stream;

  Future<List<Palestra>> _palestras() async {
    try {
      var response = await _dio.get("https://pastebin.com/raw/vXupGJD7");

      var jsonResult = Json.jsonDecode(response.data);

      return jsonResult
          .map<Palestra>((palestra) => Palestra.fromJson(palestra))
          .toList();
    } catch (e) {
      print("Erro $e");

      return List<Palestra>();
    }
  }

  dispose() {
    _controller.close();
  }
}
