import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:core/core/error/data_failure.dart';

class DataBase {
  Future<Either<DataFailure, String>> getRepositoryHttp() async {
    const String url =
        'https://api.github.com/search/repositories?q=language:java&sort=stars&order=desc&page=1';
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final String json = jsonEncode(jsonDecode(response.body)["items"]);
      return Right(json);
    } else {
      return Left(DataFailure(message: response.body));
    }
  }
}
