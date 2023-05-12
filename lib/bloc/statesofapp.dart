


import 'package:dummy/Model/productdatamodel.dart';
import 'package:equatable/equatable.dart';

abstract class Pagestates extends Equatable{}

class Pageloading extends Pagestates{
  List<Object?> get props=> [];
}
class Pageloadedstate extends Pagestates{
  Pageloadedstate(this.Data);
  final List<Datamodel> Data;
  @override
  List<Object?> get props=> [Data];
}

class Pagerrorstate extends Pagestates{
  Pagerrorstate(this.error);
  final String error;
  @override
  List<Object?> get props=> [error];
}
