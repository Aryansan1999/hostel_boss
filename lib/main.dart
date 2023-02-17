import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostel_boss/screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hostel_boss/users.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
List<Users> basketItems=[];
class MyApp extends StatelessWidget {





  fetchRecords() async{
     var records=await FirebaseFirestore.instance.collection('KP2').get();
     mapRecords(records);
  }
  mapRecords(QuerySnapshot<Map<String,dynamic>> records) {
    var _list = records.docs.map((users) =>
        Users(id: users.id,
            name: users['name'],
            charge: users['charge'],
            product: users['product'])).toList();

    basketItems = _list;
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      title: 'Flutter Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Flutter Tutorial'),
          ),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: basketItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.network(
                          //     'https://media.istockphoto.com/id/171302954/photo/groceries.jpg?s=612x612&w=0&k=20&c=D3MmhT5DafwimcYyxCYXqXMxr1W25wZnyUf4PF1RYw8='),
                          // Text("Product from Room: 2A-62"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Owner: "+basketItems[index].name),
                              SizedBox(
                                width: 20,
                              ),
                              RaisedButton(
                                  onPressed: () {},
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)),
                                  child: Text('Buy'))
                            ],
                          ),
                          Text("Room delivery charge: "+basketItems[index].charge),
                          Text("Available: "+basketItems[index].product)
                        ]),
                    margin: new EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    padding: EdgeInsets.all(30.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xFFffffff),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purple,
                          blurRadius: 15.0, // soften the shadow
                          spreadRadius: 1.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 5  horizontally
                            5.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                    ),
                  );
                })
        ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){

              }

          )
  )
    );
  }


}
