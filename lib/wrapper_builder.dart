import 'package:flutter/material.dart';
import 'package:mathy_extended/models/firebase/user.dart';
import 'package:mathy_extended/services/firebase/database/database_provider.dart';
import 'package:provider/provider.dart';

class WrapperBuilder extends StatelessWidget {
  final Widget Function() builder;
  WrapperBuilder({@required this.builder});

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context);
    if (_user != null) {
      return MultiProvider(
        providers: [
          Provider<DatabaseProvider>(
            create: (_) => DatabaseProvider(
              uid: _user.uid,
            ),
          ),
          StreamProvider<User>.value(
              value: DatabaseProvider(
            uid: _user.uid,
          ).userDetail),
        ],
        child: builder(),
      );
    }
    return builder();
  }
}
