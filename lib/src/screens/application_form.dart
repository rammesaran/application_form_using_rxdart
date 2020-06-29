import 'package:application_from_app/src/bloc/bloc_provider.dart';
import 'package:application_from_app/src/bloc/form_bloc.dart';
import 'package:flutter/material.dart';

class ApplicationForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final FormBloc bloc = BlocProvider.of(context).formBloc;

    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            emailTextField(bloc),
            nameTextField(bloc),
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),

            ),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailTextField(FormBloc bloc){

    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
             errorText: snapshot.error,
            hintText: 'Enter Email',
            labelText: "Email",
          ),
          onChanged: bloc.changeEmail,
        );
      }
    );
  }

  Widget nameTextField(FormBloc bloc){
    return StreamBuilder<String>(
      stream: bloc.name,
      builder: (context, snapshot) {
        return TextField(
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'Enter Name',
            labelText: 'Name',
          ),
          onChanged: bloc.changeName,
        );
      }
    );
  }

  Widget submitButton(FormBloc bloc){

    return StreamBuilder<bool>(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: (snapshot.data!=true) ? null : bloc.submit,
          child: Text('Submit'),
        );
      }
    );
  }
}