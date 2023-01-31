import 'dart:convert';

import 'package:core/core/database.dart';
import 'package:core/core/error/data_failure.dart';
import 'package:core/layers/data/datasource/i_pull_request_datasource.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:dartz/dartz.dart';
import 'package:core/layers/data/models/pull_request_model.dart';
import 'package:http/http.dart' as http;

class PullRequestRemoteDataSourceImp implements IPullRequestDataSource {
  final DataBase dataBase;
  PullRequestRemoteDataSourceImp({required this.dataBase});

  @override
  Future<Either<DataFailure, List<PullRequestModel>>> load() async {
    final result = await dataBase.getPrHttp('???????????');
    return result.fold((l) => Left(l), (r) {
      List<PullRequestModel> list = [];
      for (var element in jsonDecode(r)) {
        try {
          list.add(PullRequestModel.fromMap(element));
        } catch (error) {
          return Left(DataFailure(message: error.toString()));
        }
      }
      return Right(list);
    });
  }
}
