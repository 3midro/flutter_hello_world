import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:xml/xml.dart';
import 'package:hello_world/database_helper.dart';
//import 'dart:async';

//import 'package:path/path.dart';
//import 'package:sqflite/sqflite.dart';

void main() =>
  //runApp(MyApp());
  runApp(TabBarDemo());
  
  //form1
  TextEditingController textoCtrl = new TextEditingController();

  //form2
  TextEditingController nameCtrl = new TextEditingController();
  TextEditingController mobileCtrl = new TextEditingController();
  String gender = 'hombre';
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController passwordCtrl = new TextEditingController();
  TextEditingController repeatPassCtrl = new TextEditingController();

  //form3
  TextEditingController nombreCtrl = new TextEditingController();
  TextEditingController apeCtrl = new TextEditingController();

  //form4
  TextEditingController deporteCtrl = new TextEditingController();
  TextEditingController edadCtrl = new TextEditingController();

  //form5
  String color = 'azul';
  String transporte = 'carro';
  String tamanio = 'chico';

  //coneccion DB
  final dbHelper = DatabaseHelper.instance;
  

  /*final bookshelfXml = '''<?xml version="1.0"?>
    <bookshelf>
      <book>
        <title lang="english">Growing a Language</title>
        <price>29.99</price>
      </book>
      <book>
        <title lang="english">Learning XML</title>
        <price>39.95</price>
      </book>
      <price>132.00</price>
    </bookshelf>''';
  final document = XmlDocument.parse(bookshelfXml);
  print(document.toString());
  print(document.toXmlString(pretty: true, indent: '\t'));
  //creaDB();
}*/

/*void creaDB() async {
  final database = openDatabase(
    // Establecer la ruta a la base de datos. Nota: Usando la función `join` del
    // complemento `path` es la mejor práctica para asegurar que la ruta sea correctamente
    // construida para cada plataforma.
    join(await getDatabasesPath(), 'doggie_database1.db'),
    // Cuando la base de datos se crea por primera vez, crea una tabla para almacenar dogs
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Establece la versión. Esto ejecuta la función onCreate y proporciona una
    // ruta para realizar actualizacones y defradaciones en la base de datos.
    version: 3,
  );
  print("Creo BD");
}*/

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_bus)),
                Tab(icon: Icon(Icons.directions_ferry)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              MyApp2(),
              RegisterPage(),
              Formulario1(),
              Formulario2(),
              //Icon(Icons.directions_ferry),
              MyApp(),
            ],
          ),
        ),
      ),
    );
  }
}

class Formulario1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Formulario 1';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Form1(),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}



class MyForm1 extends State<Form1> { 
  
  //final dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();
  // GlobalKey<FormState> keyForm = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: nombreCtrl,
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
            /* validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            }, */
          ),
          TextFormField(
            controller: apeCtrl,
            decoration: InputDecoration(
              labelText: 'Apellido',
            ),
            //keyboardType: TextInputType.phone,
            //maxLength: 2,
            /* validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },*/
          ),
          /*GestureDetector(
            onTap: () {
              /*print('El Transporte es -> ${transporte.toString()}');
              print('El color es -> ${color.toString()}');
              print('El Tamaño es -> ${tamanio.toString()}');*/
              _insert(nombreCtrl.text,apeCtrl.text);
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Insertar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),*/
            GestureDetector(
            onTap: () {
              _ver();
            },
            child: Container(
              margin: new EdgeInsets.all(20.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Ver",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),
          GestureDetector(
            onTap: () {
              _borrar();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Borrar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),
        ],
      ),
    );
  }
  

void _insert(String a, String b) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnNombre : a,
    DatabaseHelper.columnApellido : b
  };
  final id = await dbHelper.insert("table_datos",row);
  print("Se inserto el ID -> $id");
}
void _ver() async{
  final allRows = await dbHelper.queryAllRows("table_datos");
  print("Contenido de la BD");
  allRows.forEach((row) => print(row));
}
void _borrar() async {
    final id = await dbHelper.queryRowCount("table_datos");
    final rowsDeleted = await dbHelper.delete("table_datos",id);
    print("Se borraron $rowsDeleted registros con el id -> $id");
}


}

class Formulario2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Formulario 2';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Form2(),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}

// Crea un Widget Form 2
class Form2 extends StatefulWidget {
  @override
  MyForm2 createState() {
    return MyForm2();
  }
}

class MyForm2 extends State<Form2> {
  final _formKey = GlobalKey<FormState>();
  //final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: deporteCtrl,
            decoration: InputDecoration(
              labelText: 'Deporte',
            ),
          ),TextFormField(
            controller: edadCtrl,
            decoration: InputDecoration(
              labelText: 'Numero',
            ),
            keyboardType: TextInputType.phone,
            maxLength: 2,
          ),
          /*GestureDetector(
            onTap: () {
              /*print('El Transporte es -> ${transporte.toString()}');
              print('El color es -> ${color.toString()}');
              print('El Tamaño es -> ${tamanio.toString()}');*/
              _insert(deporteCtrl.text,edadCtrl.text);
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Insertar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),*/
          GestureDetector(
            onTap: () {
              _ver();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Ver",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),
          GestureDetector(
            onTap: () {
              _borrar();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Borrar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            )
        ],
      ),
    );
  }
  void _insert(String a, String b) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnDeporte : a,
    DatabaseHelper.columnEdad : b
  };
  final idDep = await dbHelper.insert("table_deportes",row);
  print("Se inserto el ID -> $idDep");
}
void _ver() async{
  final allRows = await dbHelper.queryAllRows("table_deportes");
  print("Contenido de la BD");
  allRows.forEach((row) => print(row));
}
void _borrar() async {
    final idDep = await dbHelper.queryRowCount("table_deportes");
    final rowsDeleted = await dbHelper.deleteDeporte("table_deportes",idDep);
    print("Se borraron $rowsDeleted registros con el id -> $idDep");
}

}

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea un Widget Form 1
class Form1 extends StatefulWidget {
  @override
  MyForm1 createState() {
    return MyForm1();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  //final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: textoCtrl,
            decoration: new InputDecoration(
                labelText: 'Escribe Texto',
              ),
            validator: (textoCtrl) {
              if (textoCtrl.isEmpty) {
                return 'Porfavor escribe algo';
              }
            },
          ),
          /*GestureDetector(
            onTap: () {
              _insert(textoCtrl.text);
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Insertar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),*/
            GestureDetector(
            onTap: () {
              _ver();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Ver",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),
            GestureDetector(
            onTap: () {
              _borrar();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Borrar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            )
        ],
      ),
    );
  }

  void _insert(String texto) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnTxt : texto
  };
  final idOpc = await dbHelper.insert("table_texto",row);
  print("Se inserto el ID -> $idOpc");
}

void _ver() async{
  final allRows = await dbHelper.queryAllRows("table_texto");
  print("Contenido de la BD");
  allRows.forEach((row) => print(row));
}
void _borrar() async {
    final idOpc = await dbHelper.queryRowCount("table_texto");
    final rowsDeleted = await dbHelper.deleteTexto("table_texto",idOpc);
    print("Se borraron $rowsDeleted registros con el id -> $idOpc");
}

}


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Probar Radio buttons';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomRadio(),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}

// Crea un Widget Form
class MyCustomRadio extends StatefulWidget {
  @override
  MyCustomRadioFormState createState() {
    return MyCustomRadioFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con
// el formulario.
class MyCustomRadioFormState extends State<MyCustomRadio> {
  final _formKey = GlobalKey<FormState>();
  //final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(60.0),
            child: new Form(
              key: _formKey,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }
  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }



  Widget formUI() {
    return Column(
      children: <Widget>[
        formItemsDesign(
            Icons.emoji_transportation,
            Column(children: <Widget>[
              Text("Transporte"),
              RadioListTile<String>(
                title: Text('Carro'),
                value: 'carro',
                groupValue: transporte,
                onChanged: (value) {
                  setState(() {
                    transporte = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Bici'),
                value: 'Bici',
                groupValue: transporte,
                onChanged: (value) {
                  setState(() {
                    transporte = value;
                  });
                },
              )
            ])),
        formItemsDesign(
            Icons.color_lens,
            Column(children: <Widget>[
              Text("Color"),
              RadioListTile<String>(
                title: Text('Azul'),
                value: 'azul',
                groupValue: color,
                onChanged: (value) {
                  setState(() {
                    color = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Rojo'),
                value: 'rojo',
                groupValue: color,
                onChanged: (value) {
                  setState(() {
                    color = value;
                  });
                },
              )
            ])),
            formItemsDesign(
            Icons.photo_size_select_large,
            Column(children: <Widget>[
              Text("Tamaño"),
              RadioListTile<String>(
                title: Text('Chico'),
                value: 'chico',
                groupValue: tamanio,
                onChanged: (value) {
                  setState(() {
                    tamanio = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Medio'),
                value: 'medio',
                groupValue: tamanio,
                onChanged: (value) {
                  setState(() {
                    tamanio = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Largo'),
                value: 'largo',
                groupValue: tamanio,
                onChanged: (value) {
                  setState(() {
                    tamanio = value;
                  });
                },
              )
            ])),
        /*GestureDetector(
            onTap: () {
              /*print('El Transporte es -> ${transporte.toString()}');
              print('El color es -> ${color.toString()}');
              print('El Tamaño es -> ${tamanio.toString()}');*/
              _insert(transporte.toString(),color.toString(),tamanio.toString());
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Insertar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),*/
            GestureDetector(
            onTap: () {
              _ver();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Ver",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),
            GestureDetector(
            onTap: () {
              _borrar();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Borrar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),
            GestureDetector(
            onTap: () {
              guardarInfo();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("GUARDAR INFORMACION",
                  style: TextStyle(
                      color: Colors. black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            ),
      ],
    );
  }

void _insert(String a, String b, String c) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnTransporte : a,
    DatabaseHelper.columnColor : b,
    DatabaseHelper.columnTam : c,
  };
  final idOpc = await dbHelper.insert("table_opciones",row);
  print("Se inserto el ID -> $idOpc");
}

void _ver() async{
  final allRows = await dbHelper.queryAllRows("table_opciones");
  print("Contenido de la BD");
  allRows.forEach((row) => print(row));
}
void _borrar() async {
    final idOpc = await dbHelper.queryRowCount("table_opciones");
    final rowsDeleted = await dbHelper.deleteOpciones("table_opciones",idOpc);
    print("Se borraron $rowsDeleted registros con el id -> $idOpc");
}

void guardarInfo() async{
  if(textoCtrl.text.isNotEmpty && nameCtrl.text.isNotEmpty && mobileCtrl.text.isNotEmpty &&
    emailCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty && repeatPassCtrl.text.isNotEmpty &&
    nombreCtrl.text.isNotEmpty && apeCtrl.text.isNotEmpty && deporteCtrl.text.isNotEmpty && edadCtrl.text.isNotEmpty
    ){
  insertarForm1(textoCtrl.text);
  insertarForm2(nameCtrl.text,mobileCtrl.text,gender.toString(),emailCtrl.text,passwordCtrl.text,repeatPassCtrl.text);
  insertarForm3(nombreCtrl.text,apeCtrl.text);
  insertarForm4(deporteCtrl.text,edadCtrl.text);
  insertarForm5(transporte.toString(),color.toString(),tamanio.toString());
  textoCtrl.clear();
  nameCtrl.clear();
  mobileCtrl.clear();
  emailCtrl.clear();
  passwordCtrl.clear();
  repeatPassCtrl.clear();
  nombreCtrl.clear();
  apeCtrl.clear();
  deporteCtrl.clear();
  edadCtrl.clear();
    }else{
      print('Un campo viene vacio, no se puede insertar');
    }
}

void insertarForm1(String texto) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnTxt : texto
  };
  final idOpc = await dbHelper.insert("table_texto",row);
  print("Se inserto el ID -> $idOpc");
}

void insertarForm2(String n, String t, String g, String e, String p, String rp) async {
  //row to insert
  Map<String, dynamic> row = {
    DatabaseHelper.columnName : n,
    DatabaseHelper.columnTel : t,
    DatabaseHelper.columnGen : g,
    DatabaseHelper.columnEmail : e,
    DatabaseHelper.columnPass : p,
    DatabaseHelper.columnPassrep : rp,
  };
  final idOpc = await dbHelper.insert("table_registro",row);
  print("Se inserto el ID -> $idOpc");
}

void insertarForm3(String a, String b) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnNombre : a,
    DatabaseHelper.columnApellido : b
  };
  final id = await dbHelper.insert("table_datos",row);
  print("Se inserto el ID -> $id");
}

void insertarForm4(String a, String b) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnDeporte : a,
    DatabaseHelper.columnEdad : b
  };
  final idDep = await dbHelper.insert("table_deportes",row);
  print("Se inserto el ID -> $idDep");
}

void insertarForm5(String a, String b, String c) async {
  //row to insert
  //print("El valor de a es: ${a.toString()} y el valor de b es: ${b.toString()}");
  Map<String, dynamic> row = {
    DatabaseHelper.columnTransporte : a,
    DatabaseHelper.columnColor : b,
    DatabaseHelper.columnTam : c,
  };
  final idOpc = await dbHelper.insert("table_opciones",row);
  print("Se inserto el ID -> $idOpc");
}

}


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> keyForm = new GlobalKey();
  //final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Registrarse'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(60.0),
            child: new Form(
              key: keyForm,
              child: formUI(),
            ),
          ),
        ),
      ),
    );
  }

  formItemsDesign(icon, item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Card(child: ListTile(leading: Icon(icon), title: item)),
    );
  }

  

  Widget formUI() {
    return Column(
      children: <Widget>[
        formItemsDesign(
            Icons.person,
            TextFormField(
              controller: nameCtrl,
              decoration: new InputDecoration(
                labelText: 'Nombre',
              ),
              validator: validateName,
            )),
        formItemsDesign(
            Icons.phone,
            TextFormField(
              controller: mobileCtrl,
              decoration: new InputDecoration(
                labelText: 'Numero de telefono',
              ),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              validator: validateMobile,
            )),
        formItemsDesign(
            null,
            Column(children: <Widget>[
              Text("Genero"),
              RadioListTile<String>(
                title: const Text('Hombre'),
                value: 'hombre',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mujer'),
                value: 'mujer',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              )
            ])),
        formItemsDesign(
            Icons.email,
            TextFormField(
              controller: emailCtrl,
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 32,
              validator: validateEmail,
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            )),
        formItemsDesign(
            Icons.remove_red_eye,
            TextFormField(
              controller: repeatPassCtrl,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repetir la Contraseña',
              ),
              validator: validatePassword,
            )),
        GestureDetector(
            onTap: () {
              save();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Verificar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            )),
            GestureDetector(
            onTap: () {
              _ver();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Ver",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            )),
            GestureDetector(
            onTap: () {
              _borrar();
            },
            child: Container(
              margin: new EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                gradient: LinearGradient(colors: [
                  Color(0xFF0EDED2),
                  Color(0xFF03A0FE),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Text("Borrar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ))
      ],
    );
  }

  String validatePassword(String value) {
    print("valorrr $value passsword ${passwordCtrl.text}");
    if (value != passwordCtrl.text) {
      return "Las contraseñas no coinciden";
    }
    return null;
  }

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El nombre es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "El nombre debe de ser a-z y A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "El telefono es necesariod";
    } else if (value.length != 10) {
      return "El numero debe tener 10 digitos";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  save() {
    if (keyForm.currentState.validate()) {
      print('Esta bien validado');
      //_insert(nameCtrl.text,mobileCtrl.text,gender.toString(),emailCtrl.text,passwordCtrl.text,repeatPassCtrl.text);
      //keyForm.currentState.reset();
    }
  }
  void _insert(String n, String t, String g, String e, String p, String rp) async {
  //row to insert
  Map<String, dynamic> row = {
    DatabaseHelper.columnName : n,
    DatabaseHelper.columnTel : t,
    DatabaseHelper.columnGen : g,
    DatabaseHelper.columnEmail : e,
    DatabaseHelper.columnPass : p,
    DatabaseHelper.columnPassrep : rp,
  };
  final idOpc = await dbHelper.insert("table_registro",row);
  print("Se inserto el ID -> $idOpc");
}

void _ver() async{
  final allRows = await dbHelper.queryAllRows("table_registro");
  print("Contenido de la BD");
  allRows.forEach((row) => print(row));
}
void _borrar() async {
    final idOpc = await dbHelper.queryRowCount("table_registro");
    final rowsDeleted = await dbHelper.deleteRegistro("table_registro",idOpc);
    print("Se borraron $rowsDeleted registros con el id -> $idOpc");
}

}



/*class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  // Implementa toString para que sea más fácil ver información sobre cada perro
  // usando la declaración de impresión.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}

void save2SQLlite() async {
  print("guardar en sqllite");

  final database = openDatabase(
    // Establecer la ruta a la base de datos. Nota: Usando la función `join` del
    // complemento `path` es la mejor práctica para asegurar que la ruta sea correctamente
    // construida para cada plataforma.
    join(await getDatabasesPath(), 'doggie_database.db'),
    // Cuando la base de datos se crea por primera vez, crea una tabla para almacenar dogs
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    // Establece la versión. Esto ejecuta la función onCreate y proporciona una
    // ruta para realizar actualizacones y defradaciones en la base de datos.
    version: 3,
  );

  // A continuación, define la función para insertar dogs en la base de datos
  Future<void> insertDog(Dog dog) async {
    // Obtiene una referencia de la base de datos
    final Database db = await database;

    // Inserta el Dog en la tabla correcta. También puede especificar el
    // `conflictAlgorithm` para usar en caso de que el mismo Dog se inserte dos veces.
    // En este caso, reemplaza cualquier dato anterior.
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// Ahora, puedes crear un Dog y agregarlo a la tabla dogs!
  final fido = Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );

  final pelusa = Dog(
    id: 1,
    name: 'pelusa',
    age: 20,
  );

  await insertDog(fido);
  await insertDog(pelusa);

// Un método que recupera todos los dogs de la tabla dogs
  Future<List<Dog>> dogs() async {
    // Obtiene una referencia de la base de datos
    final Database db = await database;

    // Consulta la tabla por todos los Dogs.
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    // Convierte List<Map<String, dynamic> en List<Dog>.
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

// Ahora, puedes usar el método anterior para recuperar todos los dogs!
  print("lista de perros");
  print(await dogs()); // Imprime una lista que contiene a Fido
}*/
