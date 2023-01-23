import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:dartz/dartz.dart';

abstract class IPullRequestRepository {
  Future<Either<Failure, PullRequest>> load();
}
