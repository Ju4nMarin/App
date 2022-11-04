import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const List<String> _lista2 = <String>['1', '2', '3', '4', '5', '6'];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UCC DAX",
      home: contenido(),
    );
  }
}

class contenido extends StatefulWidget {
  const contenido({super.key});

  @override
  State<contenido> createState() => _contenidoState();
}

class _contenidoState extends State<contenido> {
  int _pag = 1;
  var _lista = ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'];
  String dropdownValue = _lista2.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UCCDAX"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Nombre",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String name) {},
            ),
          ),

          Padding(
            padding: EdgeInsets.all(30.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Sala",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0))),
              onChanged: (String name) {},
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_downward),
              value: dropdownValue,
              isExpanded: true,
              underline: Container(
                height: 2,
                color: Colors.blue,
              ),
              items: _lista2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              hint: Text("Piso"),
            ),
          ),

          //Navegacion para las paginas
          Padding(
            padding: EdgeInsets.fromLTRB(30, 304.8, 30, 0),
            child: BottomNavigationBar(
                onTap: (index) {
                  setState(() {
                    _pag = index;
                  });
                },
                currentIndex: _pag,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.remove), label: "Eliminar"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add),
                      label: "Agregar",
                      backgroundColor: Colors.blue),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.supervised_user_circle_sharp),
                      label: "Usuario"),
                ]),
          )
        ],
      ),
    );
  }
}
