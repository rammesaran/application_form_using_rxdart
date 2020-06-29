import 'package:application_from_app/src/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'screens/application_form.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
         
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ApplicationForm(),
      ),
    );
  }
}