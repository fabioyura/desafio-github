import 'package:core/core/error/data_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:core/layers/data/models/git_rep_model.dart';

abstract class IGitRepDatasource {
  Future<Either<DataFailure, List<GitRepModel>>> load();
}
