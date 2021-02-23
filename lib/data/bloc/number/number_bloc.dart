// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  NumberBloc() : super(NumberState(number: 0));

  @override
  Stream<NumberState> mapEventToState(
    NumberEvent event,
  ) async* {
    if (event is NumberInc) {
      yield state.copyWith(number: (state.number + 1));
    }
    if (event is NumberDec) {
      yield state.copyWith(number: (state.number - 1));
    }
  }
}
