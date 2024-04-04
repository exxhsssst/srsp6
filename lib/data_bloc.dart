import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'data_model.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final http.Client httpClient;

  DataBloc({required this.httpClient}) : super(DataInitial()) {
    on<FetchData>((event, emit) async {
      emit(DataLoading());
      try {
        final data = await fetchDataFromAPI();
        emit(DataLoaded(data: data));
      } catch (e) {
        emit(DataError(message: 'Failed to fetch data'));
      }
    });
  }

  Future<List<DataModel>> fetchDataFromAPI() async {
    final response = await httpClient.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => DataModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
