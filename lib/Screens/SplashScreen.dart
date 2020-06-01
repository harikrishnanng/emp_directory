import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:employeedirectory/blocs/events/FetchEmployeesEvent.dart';
import 'package:employeedirectory/blocs/states/FetchEmpyeesState.dart';
import 'package:employeedirectory/blocs/FetchEmplyeesBloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FetchEmplyeesBloc _empBlocSink;

  @override
  void dispose() {
    super.dispose();
    _empBlocSink?.close();
  }

  @override
  Widget build(BuildContext context) {
    _empBlocSink = BlocProvider.of<FetchEmplyeesBloc>(context);
    _empBlocSink.add(LoadStart());
    return Container(
        width: double.infinity,
        child: BlocBuilder<FetchEmplyeesBloc, FetchEmployeesState>(
            builder: (context, state) {
          return Center(
            child: Text('Employee Directory'),
          );
        }));
  }
}
