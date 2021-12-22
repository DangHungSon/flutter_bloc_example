// Tao lenh de call qua bloc
import 'package:equatable/equatable.dart';

abstract class DataEvents extends Equatable {
  const DataEvents();
}

// Command get data
class GetDataEvent extends DataEvents {
  final bool isError;
  const GetDataEvent({this.isError = false});

  @override
  List<Object?> get props => [isError];
}