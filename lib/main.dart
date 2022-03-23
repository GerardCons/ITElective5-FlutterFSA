import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kicks_club/screens/addScreen.dart';

// com.example.kicks_club
// 24:7B:1B:52:6E:27:71:02:75:E9:FA:68:F6:E2:E4:8D:49:C6:E3:F2

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kicks Club'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Stream<QuerySnapshot> _itemStream =
      FirebaseFirestore.instance.collection('items').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Kicks Club',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !kIsWeb
                  ? IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.plusCircle,
                        size: 25,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addScreen()),
                        );
                      })
                  : Container(),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: Container(
          child: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: _itemStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong' + snapshot.error.toString());
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  color: Color(0xFFF5F5F5),
                  elevation: 10,
                  borderOnForeground: true,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 35.0),
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          data['Category'],
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Container(
                            child: Image(
                          image: NetworkImage(data['image_url']),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.4,
                        )),
                        Text(
                          data['brand'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '(' + data['style'] + ')',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Stocks Remaining: ' + data['stocks'].toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Php ' + data['price'].toString() + '.00',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      )),
    );
  }
}
