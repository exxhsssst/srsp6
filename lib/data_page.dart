import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_bloc.dart';

class DataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DataLoaded) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final data = state.data[index];
                return ListTile(
                  title: Text(data.title),
                  subtitle: Text(data.body),
                );
              },
            );
          } else if (state is DataError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
