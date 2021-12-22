import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/data_bloc/data_bloc.dart';
import 'package:flutter_bloc_example/blocs/data_bloc/data_states.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      // Data bloc
      BlocProvider<DataBloc>(
        create: (BuildContext context) => DataBloc(initialState: const DataStateInitial()),
      ),
      // Theme bloc...
    ];
  }
}