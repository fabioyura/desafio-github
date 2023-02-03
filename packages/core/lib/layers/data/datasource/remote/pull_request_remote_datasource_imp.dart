import 'dart:convert';

import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:http/http.dart' as http;

import 'package:core/core/error/data_failure.dart';
import 'package:core/layers/data/datasource/i_pull_request_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:core/layers/data/models/pull_request_model.dart';

class PullRequestRemoteDataSourceImp implements IPullRequestDataSource {
  PullRequestRemoteDataSourceImp();

  @override
  Future<Either<DataFailure, List<PullRequestModel>>> load(
      {required GitRep rep}) async {
    final url =
        'https://api.github.com/repos/${rep.userName}/${rep.name}/pulls';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      final jsonMap = jsonList.map((e) => PullRequestModel.fromMap(e)).toList();
      print(url);
      return Right(jsonMap);
    } else {
      return Left(DataFailure(message: response.body));
    }
  }
}
