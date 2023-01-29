import 'dart:convert';

import 'package:core/core/database.dart';
import 'package:core/core/error/data_failure.dart';
import 'package:core/layers/data/datasource/i_git_rep_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:core/layers/data/models/git_rep_model.dart';

class GitRepRemoteDataSourceImp implements IGitRepDatasource {
  final DataBase dataBase;
  GitRepRemoteDataSourceImp({required this.dataBase});

  @override
  Future<Either<DataFailure, List<GitRepModel>>> load() async {
    final result = await dataBase.getRepositoryHttp();
    return result.fold((l) => Left(l), (r) {
      List<GitRepModel> list = [];
      for (var element in jsonDecode(r)) {
        try {
          list.add(GitRepModel.fromMap(element));
        } catch (error) {
          return Left(DataFailure(message: error.toString()));
        }
      }
      return Right(list);
    });
  }
}
