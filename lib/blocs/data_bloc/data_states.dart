import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/models/data_model.dart';

abstract class DataStates extends Equatable {
  const DataStates();

  @override
  List<Object?> get props => [];
}

// Initial state
class DataStateInitial extends DataStates {
  const DataStateInitial();

  @override
  List<Object?> get props => [];
}

// Loading state
class DataStateLoading extends DataStates {
  const DataStateLoading();

  @override
  List<Object?> get props => [];
}

// Get data success state
class DataStateSuccess extends DataStates {
  // Data list
  final List<DataModel> dataList;
  // Constructor
  const DataStateSuccess({required this.dataList});

  @override
  List<Object?> get props => [dataList];
}

// Get data error state
class DataStateError extends DataStates {
  // Data list
  final String message;
  // Constructor
  const DataStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
