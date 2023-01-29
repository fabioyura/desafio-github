import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:core/core/error/data_failure.dart';

class DataBase {
  Future<Either<DataFailure, String>> getRepositoryHttp() async {
    const String url =
        'https://api.github.com/search/repositories?q=language:java&sort=stars&order=desc&page=1';
    http.Response result = await http.get(Uri.parse(url));

    if (result.statusCode == 200) {
      //Catch the result.body and convert to List = JsonEncode
      //TODO: IMPLEMENT COMMENTARY
      final String json = jsonEncode(jsonDecode(result.body)["items"]);
      return Right(json);
    } else {
      return Left(DataFailure(message: result.body));
    }
  }
}
