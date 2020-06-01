import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class FetchEmployeesState extends Equatable {}

class LatestEmployeeState extends FetchEmployeesState {
  final List employees;
  LatestEmployeeState({@required this.employees});

  @override
  List<Object> get props => [this.employees];
}
