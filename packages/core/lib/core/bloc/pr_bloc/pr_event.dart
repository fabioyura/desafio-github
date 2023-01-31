import 'package:equatable/equatable.dart';

abstract class PrEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnPrEventLoad extends PrEvent {}

class OnPrEventError extends PrEvent {}
