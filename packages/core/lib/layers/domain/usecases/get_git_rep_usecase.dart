import 'package:core/core/error/failure.dart';
import 'package:core/core/usecase.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:dartz/dartz.dart';

class GetGitRepUseCase extends UseCase {
  final IGitRepRepository repository;
  GetGitRepUseCase({required this.repository});
  @override
  Future<Either<Failure, dynamic>> call() {
    return repository.load();
  }
}
