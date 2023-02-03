import 'package:core/core/error/failure.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:equatable/equatable.dart';

abstract class PrState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PrStateNotLoaded extends PrState {}

class PrStateEmpty extends PrState {}

class PrStateError extends PrState {
  final Failure error;
  PrStateError({required this.error});
  @override
  List<Object?> get props => [error];
}

class PrStateLoaded extends PrState {
  final List<PullRequest> list;
  PrStateLoaded({required this.list});

  @override
  List<Object?> get props => [list];
}
