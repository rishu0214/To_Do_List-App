import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todoList =[];
  String singlevalue="";

  addString(content){
    setState(() {
      singlevalue=content;
    });
  }


  addList(){
    setState(() {
      todoList.add({"value":singlevalue});
    });
  }

  deleteItem(index){
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'To Do Application',
                style: TextStyle(
            fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
        elevation: 0,
      ),

      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,

                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context,index){
                  return Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.blueGrey,
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(7),

                        child: Row(
                          children: [
                            Expanded(
                              flex:80,
                                child: Text(todoList[index]['value'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ),
                            Expanded(
                                flex: 20,

                                child: CircleAvatar(

                                  radius: 30,
                                  backgroundColor: Colors.white,

                                  child: TextButton(
                                    onPressed: (){
                                  deleteItem(index);
                                    },
                                    child: Icon(Icons.delete,
                                    color: Colors.black,

                                    ),
                                  ),
                                )

                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

            ),
            Expanded(
              flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                        child: Container(
                          height: 50,
                          child: TextFormField(

                            onChanged: (content){
                              addString(content);
                            },

                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                              ),
                              fillColor: Colors.blue[100],
                              filled: true,
                              labelText: 'Create Task',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ),
                    Expanded(
                      flex: 3,
                        child: SizedBox(width: 5,)),
                    Expanded(
                      flex: 27,
                        child: ElevatedButton(
                         onPressed: (){
                           addList();
                         },
                          child: Container(
                            height: 15,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text("Add")),
                        ),
                    ),
                  ],
                )
            )],
        ),
      ),

    );
  }
}
