import 'package:core/layers/data/datasource/i_git_rep_datasource.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:dartz/dartz.dart';

class GitRepRepositoryImp implements IGitRepRepository {
  final IGitRepDatasource datasource;
  GitRepRepositoryImp({required this.datasource});
  @override
  Future<Either<Failure, List<GitRep>>> load() async {
    final result = await datasource.load();
    return result.fold((l) => Left(l), (r) => Right(r));
  }
}
