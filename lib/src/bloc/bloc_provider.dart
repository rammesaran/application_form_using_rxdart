import 'package:application_from_app/src/bloc/form_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {

  final _formBloc = FormBloc();
  FormBloc get formBloc => _formBloc;
  //AuthBloc get authBloc => _authBloc;

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static BlocProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<BlocProvider>());
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return true;
    
  }
}