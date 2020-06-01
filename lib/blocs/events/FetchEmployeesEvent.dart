import 'package:equatable/equatable.dart';

abstract class FetchEmployeesEvent extends Equatable {}

class LoadStart extends FetchEmployeesEvent {
  @override
  List<Object> get props => [];
}

class LoadComplete extends FetchEmployeesEvent {
  @override
  List<Object> get props => [];
}

