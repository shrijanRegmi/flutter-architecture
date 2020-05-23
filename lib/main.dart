import 'package:flutter/material.dart';
import 'package:mathy_extended/models/firebase/user.dart';
import 'package:mathy_extended/services/firebase/auth/auth_provider.dart';
import 'package:mathy_extended/wrapper.dart';
import 'package:mathy_extended/wrapper_builder.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthProvider().userDetail,
      child: WrapperBuilder(
          builder: () => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                home: Wrapper(),
              )),
    );
  }
}
