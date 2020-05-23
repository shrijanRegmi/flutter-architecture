import 'package:flutter/material.dart';
import 'package:mathy_extended/viewmodels/home_viewmodel.dart';
import 'package:mathy_extended/viewmodels/view_model_provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
        viewModel: HomeViewModel(),
        builder: (model) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Flutter Demo Home Page"),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      "${model.counter}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: model.increaseValue,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FloatingActionButton(
                    onPressed: model.decreaseValue,
                    tooltip: 'Increment',
                    child: Icon(Icons.remove),
                  ),
                ],
              ) // This trailing comma makes auto-formatting nicer for build methods.
              );
        });
  }
}
