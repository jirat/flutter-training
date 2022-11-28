part of 'cal_page_bloc.dart';

@immutable
abstract class CalPageState extends Equatable {
  const CalPageState();

  String get output;

  @override
  List<Object> get props => [];
}

class CalPageInitial extends CalPageState {
  const CalPageInitial();

  @override
  String get output => "0";

  @override
  List<Object> get props => [output];
}

class CalPageFirstOperand extends CalPageState {
  const CalPageFirstOperand(this.first);

  final String first;

  @override
  String get output => first;

  @override
  List<Object> get props => [output];
}
