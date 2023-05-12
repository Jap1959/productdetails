import 'package:dummy/Model/productdatamodel.dart';
import 'package:dummy/api/apicall.dart';
import 'package:dummy/bloc/appbloc.dart';
import 'package:dummy/bloc/events.dart';
import 'package:dummy/bloc/statesofapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dummy project",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: RepositoryProvider(create: (context)=>Apicall(),
      child: const Homepage(),),
    );
  }
}
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> Blocpage(
      RepositoryProvider.of<Apicall>(context),
    )..add(DataLoadevent()),
    child: Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: BlocBuilder<Blocpage,Pagestates>(builder: (context,state){
        if(state is Pageloading){
          print("HIII---------->");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is Pageloadedstate){
          // List<Datamodel> productList=state.Data;
          print("HIIIII------------>");
          return Center(
            child: Text(
              "HIII",style: TextStyle(color: Colors.amber),
            ),
          );
          // return ListView.builder(
          //   itemCount: productList.length,
          //     itemBuilder: (_,index){
          //     return Card(
          //       color: Colors.purple,
          //       margin: const EdgeInsets.symmetric(vertical: 10),
          //       child: ListTile(
          //         // leading: Container(
          //         //   child:NetworkImage(productList[index].image);
          //         //     // NetworkImage(productList[index].image),
          //         // ),
          //         title:Text( productList[index].title,style: TextStyle(color: Colors.white),),
          //       ),
          //     );
          // });
        }
        return Container();
      }),
    ),);
  }
}

