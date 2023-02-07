import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:core/core/database.dart';
import 'package:core/core/error/data_failure.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/data/datasource/i_pull_request_datasource.dart';
import 'package:core/layers/data/models/pull_request_model.dart';

class PullRequestRemoteDataSourceImp implements IPullRequestDataSource {
  final DataBase dataBase;
  PullRequestRemoteDataSourceImp({required this.dataBase});

  @override
  Future<Either<DataFailure, List<PullRequestModel>>> load(
      {required GitRep rep}) async {
    final result = await dataBase.getPrHttp(rep: rep);
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
