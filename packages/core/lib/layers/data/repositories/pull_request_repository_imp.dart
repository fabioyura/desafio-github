import 'package:core/layers/data/datasource/i_pull_request_datasource.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/repositories/i_pull_request_repository.dart';
import 'package:dartz/dartz.dart';

class PullRequestRepositoryImp implements IPullRequestRepository {
  final IPullRequestDataSource dataSource;
  PullRequestRepositoryImp({required this.dataSource});
  @override
  Future<Either<Failure, List<PullRequest>>> load(GitRep rep) async {
    final result = await dataSource.load(rep: rep);
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
