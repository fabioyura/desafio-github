import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:dartz/dartz.dart';

class GitRepRepositoryImp implements IGitRepRepository {
  @override
  Future<Either<Failure, GitRep>> load() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
