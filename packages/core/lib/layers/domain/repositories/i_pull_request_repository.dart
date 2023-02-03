import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:dartz/dartz.dart';

abstract class IPullRequestRepository {
  Future<Either<Failure, List<PullRequest>>> load(GitRep rep);
}
