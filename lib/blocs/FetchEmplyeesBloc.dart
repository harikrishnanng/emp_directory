import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:bloc/bloc.dart';
import 'package:employeedirectory/blocs/events/FetchEmployeesEvent.dart';
import 'package:employeedirectory/blocs/states/FetchEmpyeesState.dart';
import 'package:employeedirectory/services/EmployeeService.dart';

class FetchEmplyeesBloc extends Bloc<FetchEmployeesEvent, FetchEmployeesState> {
  @override
  FetchEmployeesState get initialState => LatestEmployeeState(employees: []);

  @override
  Stream<FetchEmployeesState> mapEventToState(
      FetchEmployeesEvent event) async* {
    List employees;
    if (event is LoadStart) {
      await EmployeeService().getEmployees().then((res) => {employees = res});
      print('data---->' + jsonEncode(employees));
      var databasesPath = await getDatabasesPath();
      var db = await openDatabase('employees.db');
      db.execute(
          'CREATE TABLE IF NOT EXISTS EmployeeData (id INTEGER PRIMARY KEY, name TEXT, username TEXT, profile_image TEXT, website TEXT)');
      List<Map<String, dynamic>> emps = List();
      for (var emp in employees) {
        emps.add(emp);
      }

      for (var item in emps) {
        await db.insert('EmployeeData', {
          'name': item["name"],
          'username': item["username"],
          'profile_image': item["profile_image"],
          'website': item["website"]
        });
      }

      yield LatestEmployeeState(employees: employees);
    }
  }
}
