
import 'package:application_from_app/src/bloc/validate_all_streams_have_data_and_no_errors.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:async';
import './validation_mixin.dart';
class FormBloc extends Object with ValidationMixin{
ValidateAllStreamsHaveDataAndNoErrors _submitValidationAll;
Stream<bool> get submitValid => _submitValidationAll?.status;

FormBloc(){
  _submitValidationAll =
        ValidateAllStreamsHaveDataAndNoErrors()
          ..listen([
            email,
            name
          ]);
}


final _email = BehaviorSubject<String>();
final _name = BehaviorSubject<String>();

//adding sink
Function(String) get changeEmail =>_email.sink.add;
Function(String) get changeName => _name.sink.add;

//adding stream
Stream<String> get email => _email.stream.transform(validatorEmail);
Stream<String> get name => _name.stream.transform(validatorName);

submit() {
  print('${_email.value} and ${_name.value}');
  }
  
  void dispose()
  {
    _email.close();
    _name.close();
  }
}