import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'cal_page_event.dart';
part 'cal_page_state.dart';

class CalPageBloc extends Bloc<CalPageEvent, CalPageState> {
  CalPageBloc() : super(const CalPageInitial()) {
    //Two Styles of writting
    on<OperandEvent>(_handleOperand);

    on<OperatorEvent>(_handleOperator);
  }

  void _handleOperand(OperandEvent event, Emitter<CalPageState> emit) {
    if (state is CalPageInitial) {
      emit(CalPageFirstOperand(event.operand));
    } else if (state is CalPageFirstOperand) {
      emit(CalPageFirstOperand("${state.output}${event.operand}"));
    }
    // Handle the rest of the state
  }

  void _handleOperator(OperatorEvent event, Emitter<CalPageState> emit) {
    if (event.operator == 'C') {
      emit(const CalPageInitial());
    }

    if (event.operator == "+/-") {
      _handlePlusMinus(event, emit);
    }

    if (event.operator == "." && !state.output.contains(".")) {
      emit(CalPageFirstOperand("${state.output}${event.operator}"));
    }
  }

  void _handlePlusMinus(OperatorEvent event, Emitter<CalPageState> emit) {
    if (state is! CalPageFirstOperand) {
      return;
    }

    if (state.output.startsWith("-")) {
      emit(CalPageFirstOperand(state.output.substring(1)));
    } else {
      emit(CalPageFirstOperand("-${state.output}"));
    }
  }
}
