import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/core/bloc/git_rep_bloc/git_rep_event.dart';
import 'package:core/core/bloc/git_rep_bloc/git_rep_state.dart';
import 'package:core/layers/domain/usecases/get_git_rep_usecase.dart';

class GitRepBloc extends Bloc<GitRepEvent, GitRepState> {
  final GetGitRepUseCase loadCase;
  GitRepBloc({required this.loadCase}) : super(GitRepStateNotLoaded()) {
    on<OnGitRepEventLoad>(_loadCase);
  }

  FutureOr<void> _loadCase(
      OnGitRepEventLoad event, Emitter<GitRepState> emit) async {
    var result = await loadCase.call();
    result.fold((l) => emit(GitRepStateError(error: l)), (r) {
      if (r.isEmpty) {
        emit(GitRepStateEmpty());
      } else {
        emit(GitRepStateLoaded(list: r));
      }
    });
  }
}
