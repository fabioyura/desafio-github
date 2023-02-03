import 'package:core/core/error/failure.dart';
import 'package:core/core/usecase.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/repositories/i_pull_request_repository.dart';
import 'package:dartz/dartz.dart';

class GetPullRequestUseCase implements UseCase2 {
  final IPullRequestRepository repository;
  GetPullRequestUseCase({required this.repository});
  @override
  Future<Either<Failure, dynamic>> call(GitRep rep) {
    return repository.load(rep);
  }
}
