import 'package:core/core/error/failure.dart';
import 'package:core/core/usecase.dart';
import 'package:core/layers/domain/repositories/i_pull_request_repository.dart';
import 'package:dartz/dartz.dart';

class GetPullRequestUseCase extends UseCase {
  final IPullRequestRepository repository;
  GetPullRequestUseCase({required this.repository});
  @override
  Future<Either<Failure, dynamic>> call() {
    return repository.load();
  }
}
