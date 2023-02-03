import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:dartz/dartz.dart';

import 'error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, dynamic>> call();
}

abstract class UseCase2<Type> {
  Future<Either<Failure, dynamic>> call(GitRep rep);
}
