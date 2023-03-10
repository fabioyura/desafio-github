import 'dart:convert';
import 'package:core/layers/domain/entities/git_rep.dart';
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

  Future<Either<DataFailure, String>> getPrHttp({required GitRep rep}) async {
    final url =
        'https://api.github.com/repos/${rep.userName}/${rep.name}/pulls';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonList = jsonEncode(jsonDecode(response.body));
      return Right(jsonList);
    } else {
      return Left(DataFailure(message: response.body));
    }
  }
}
