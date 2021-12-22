import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/blocs/data_bloc/data_events.dart';
import 'package:flutter_bloc_example/blocs/data_bloc/data_states.dart';
import 'package:flutter_bloc_example/models/data_model.dart';

class DataBloc extends Bloc<DataEvents, DataStates> {

  // Constructor & map states
  DataBloc({required DataStateInitial initialState}) : super(initialState) {
    // Important
    on<GetDataEvent>((event, emit) async {
      await _getData(event.isError, emit);
    });
  }

  // emit(Tên loại state)
  Future<DataStates?> _getData(bool isError, Emitter<DataStates> emit) async {
    emit(const DataStateLoading());
    List<DataModel> dataList = [];
    if (!isError) {
      Future.delayed(const Duration(seconds: 2), () {
      });
      for (int i = 0; i < 20; i++) {
        dataList.add(DataModel(name: 'Title $i', age: i));
      }
      emit(DataStateSuccess(dataList: dataList));
    } else {
      emit(const DataStateError(message: 'Error roi pa 123'));
    }
  }
}