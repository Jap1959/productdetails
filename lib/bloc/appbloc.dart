


import 'package:dummy/api/apicall.dart';
import 'package:dummy/bloc/events.dart';
import 'package:dummy/bloc/statesofapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Blocpage extends Bloc< DataEvent , Pagestates>{
      Apicall _apicall;
     Blocpage(this._apicall):super(Pageloading()){
       on<DataLoadevent>((event,emit)async{
         emit(Pageloading());
         print("HIII--<>");
         try{
           print("print----try");
           final Data = await _apicall.getdata();
           for(int i=0;i<Data.length;i++){
             print(Data[i].title);
             print('\n');
           }
           emit(Pageloadedstate(Data));
         }
         catch(e){
          emit(Pagerrorstate(e.toString()));
         }
       });
     }
}