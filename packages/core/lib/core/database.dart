import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:core/core/error/data_failure.dart';

Future<Either<DataFailure, String>> getRepositoryHttp() async {
  const String url =
      'https://api.github.com/search/repositories?q=language:java&sort=stars&order=desc&page=1';
  http.Response response = await http.get(Uri.parse(url));
  final String result = jsonEncode(jsonDecode(response.body)["items"]);

  if (response.statusCode == 200) {
    return Right(result);
  } else {
    return const Left(DataFailure(message: 'DataBase Failure: '));
  }
}
