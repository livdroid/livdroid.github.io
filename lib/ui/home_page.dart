import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/login_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  //TODO : make whole view scrollable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.blueGrey,
      child: Form(
          key: _formKey,
          child: Center(
              child: Container(
                  child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white,
            child: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Logo(),
                ConnectionTitle(),
                LoginFieldTitle('Nom Roleplay'),
                LoginNameField(),
                LoginFieldTitle('Mot de passe'),
                LoginPassField(),
                LoginConnectionButton(),
                ForgotPasswordTitle(),
              ],
            ),
          )))),
    ));
  }

  Widget ConnectionTitle() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      height: 50,
      width: 310,
      child: Text(
        'Connexion',
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.black87,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget LoginFieldTitle(String title) {
    return Container(
      width: 300,
      child: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: Colors.black87,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget LoginNameField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          height: 90,
          child: TextFormField(
              enableSuggestions: true,
              maxLines: 1,
              cursorColor: Colors.teal,
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.black87, fontSize: 16),
              ),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Entrez le nom de votre personnage';
                }
                return '';
              }),
        ),
      ],
    );
  }

  @override
  dispose() {
    loginBloc.dispose();
  }

  Widget LoginPassField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          height: 90,
          child: TextFormField(
            obscureText: true,
            maxLines: 1,
            cursorColor: Colors.teal,
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black87),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget LoginConnectionButton() {
    return Container(
      child: RaisedButton(
        color: Colors.amberAccent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Text(
          'Connection',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black87, fontSize: 16),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/messages');
        },
      ),
    );
  }

  Widget ForgotPasswordTitle() {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 20),
      child: FlatButton(
        child: Text('J\'ai oublié mon mot de passe'),
        onPressed: () {},
      ),
    );
  }

  Widget Logo() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Image.asset(
        'assets/logo_altica.png',
        height: 100,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
