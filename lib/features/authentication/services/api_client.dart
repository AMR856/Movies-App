import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiClient {
  final String baseUrl;
  ApiClient({this.baseUrl = Constants.BASE_URL});

  Future<http.Response> post(String path, Map<String, dynamic> body, {Map<String,String>? headers}) async {
    final uri = Uri.parse('$baseUrl$path');
    final mergedHeaders = {...Constants.jsonHeaders, if (headers != null) ...headers};
    final resp = await http.post(uri, headers: mergedHeaders, body: jsonEncode(body));
    return resp;
  }

}
