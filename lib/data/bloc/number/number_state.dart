part of 'number_bloc.dart';

class NumberState extends Equatable {
  NumberState({
    this.number,
  });

  final int number;

  @override
  List<Object> get props => [number];

  NumberState copyWith({
    int number,
  }) {
    return NumberState(
      number: number ?? this.number,
    );
  }
}
