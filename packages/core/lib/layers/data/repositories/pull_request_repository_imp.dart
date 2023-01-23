import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/repositories/i_pull_request_repository.dart';
import 'package:dartz/dartz.dart';

class PullRequestRepositoryImp implements IPullRequestRepository {
  @override
  Future<Either<Failure, List<PullRequest>>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
