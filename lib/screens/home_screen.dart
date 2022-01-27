import 'package:flutter/material.dart';
import 'package:icaros_app/models/token.dart';
import 'package:icaros_app/screens/document_types_screen.dart';
import 'package:icaros_app/screens/injury_types_screen.dart';
import 'package:icaros_app/screens/login_screen.dart';
import 'package:icaros_app/screens/procedures_screen.dart';
import 'package:icaros_app/screens/users_screen.dart';

class HomeScreen extends StatefulWidget {
  final Token token;

  HomeScreen({required this.token});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Icaro'),
      ),
      body: _getBody(),
      drawer: widget.token.user.userType == 0
          ? _getDoctorMenu()
          : _getCustomerMenu(),
    );
  }

  Widget _getBody() {
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: FadeInImage(
              placeholder: AssetImage('assets/LogoCirculo.png'),
              image: NetworkImage(widget.token.user.imageFullPath),
              fit: BoxFit.cover,
              height: 300,
              width: 300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text('Bienvenid@ ${widget.token.user.fullName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _getDoctorMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Image(
            image: AssetImage('assets/LogoCirculo.png'),
          )),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Test'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.medical_services),
            title: Text('Procedimientos'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProceduresScreen(
                            token: widget.token,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.badge),
            title: Text('Tipos de Documento'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DocumentTypesScreen(
                            token: widget.token,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.personal_injury),
            title: Text('Tipos de Lesión'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InjuryTypesScreen(
                            token: widget.token,
                          )));
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Usuarios'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsersScreen(
                            token: widget.token,
                          )));
            },
          ),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Editar Perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _getCustomerMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Image(
            image: AssetImage('assets/LogoCirculo.png'),
          )),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Test'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.personal_injury),
            title: Text('Mis Lesiones'),
            onTap: () {},
          ),
          Divider(
            color: Colors.black,
            height: 2,
          ),
          ListTile(
            leading: Icon(Icons.face),
            title: Text('Editar Perfil'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
