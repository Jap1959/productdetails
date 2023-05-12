
import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable{
  const DataEvent();
}
  class DataLoadevent extends DataEvent{
  List<Object> get props=> [];
  
  }