import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core/bloc/pr_bloc/pr_event.dart';
import 'package:core/core/bloc/pr_bloc/pr_state.dart';
import 'package:core/layers/domain/usecases/get_pull_request_usecase.dart';

class PrBloc extends Bloc<PrEvent, PrState> {
  final GetPullRequestUseCase loadCase;
  PrBloc({required this.loadCase}) : super(PrStateNotLoaded()) {
    on<OnPrEventLoad>(_loadCase);
  }

  FutureOr<void> _loadCase(OnPrEventLoad event, Emitter<PrState> emit) async {
    final result = await loadCase.call();
    result.fold((l) => emit(PrStateError(error: l)), (r) {
      if (r.isEmpty) {
        emit(PrStateEmpty());
      } else {
        emit(PrStateLoaded(pr: r));
      }
    });
  }
}
