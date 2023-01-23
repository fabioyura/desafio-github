import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:dartz/dartz.dart';

abstract class IGitRepRepository {
  Future<Either<Failure, GitRep>> load();
}
