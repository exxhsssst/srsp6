part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<DataModel> data;

  DataLoaded({required this.data});
}

class DataError extends DataState {
  final String message;

  DataError({required this.message});
}
