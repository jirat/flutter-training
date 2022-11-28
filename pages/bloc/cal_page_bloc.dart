import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'cal_page_event.dart';
part 'cal_page_state.dart';

class CalPageBloc extends Bloc<CalPageEvent, CalPageState> {
  CalPageBloc() : super(CalPageInitial()) {
    //Two Styles of writting
    on<OperandEvent>(_handleOperand);

    on<OperatorEvent>((event, emit) {
      debugPrint(event.operator);
    });
  }

  void _handleOperand(OperandEvent event, Emitter<CalPageState> emit) {
    debugPrint(event.operand);
  }

  void _handleOperator(OperatorEvent event, Emitter<CalPageState> emit) {
    debugPrint(event.operator);
  }
}
