import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:equatable/equatable.dart';

class GitRepState extends Equatable {
  const GitRepState();

  @override
  List<Object?> get props => [];
}

class GitRepStateNotLoaded extends GitRepState {}

class GitRepStateEmpty extends GitRepState {}

class GitRepStateError extends GitRepState {
  final Failure error;
  const GitRepStateError({required this.error});
  @override
  List<Object?> get props => [error];
}

class GitRepStateLoaded extends GitRepState {
  final List<GitRep> list;
  const GitRepStateLoaded({required this.list});
  @override
  List<Object?> get props => [list];
}
