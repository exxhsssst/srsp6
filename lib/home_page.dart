import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data_bloc.dart';
import 'data_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BlocProvider.value(
                value: BlocProvider.of<DataBloc>(context),
                child: DataPage(),
              )),
            );
          },
          child: Text('Go to Data Page'),
        ),
      ),
    );
  }
}
