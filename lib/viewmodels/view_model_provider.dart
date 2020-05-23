import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends ChangeNotifier> extends StatelessWidget {
  final T viewModel;
  final Widget Function(T value) builder;
  ViewModelProvider({@required this.builder, @required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => viewModel,
      child: Consumer(
        builder: (BuildContext context, T value, Widget child) =>
            builder(value),
      ),
    );
  }
}
