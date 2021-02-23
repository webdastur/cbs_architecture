part of 'number_bloc.dart';

abstract class NumberEvent extends Equatable {
  const NumberEvent();

  @override
  List<Object> get props => [];
}

class NumberInc extends NumberEvent {}

class NumberDec extends NumberEvent {}
