import 'package:core/core/error/data_failure.dart';
import 'package:core/layers/data/models/pull_request_model.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:dartz/dartz.dart';

abstract class IPullRequestDataSource {
  Future<Either<DataFailure, List<PullRequestModel>>> load(
      {required GitRep rep});
}
