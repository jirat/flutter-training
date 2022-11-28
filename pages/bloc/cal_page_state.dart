part of 'cal_page_bloc.dart';

@immutable
abstract class CalPageState extends Equatable {
  const CalPageState();

  @override
  List<Object> get props => [];
}

class CalPageInitial extends CalPageState {
  const CalPageInitial({this.output = "0"});

  final String output;

  @override
  List<Object> get props => [output];
}
