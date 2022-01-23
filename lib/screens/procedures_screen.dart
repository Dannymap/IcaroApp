import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:icaros_app/components/loader_component.dart';
import 'package:icaros_app/helpers/constans.dart';
import 'package:icaros_app/models/procedure.dart';
import 'package:icaros_app/models/token.dart';

class ProceduresScreen extends StatefulWidget {
  final Token token;

  ProceduresScreen({required this.token});

  @override
  _ProceduresScreenState createState() => _ProceduresScreenState();
}

class _ProceduresScreenState extends State<ProceduresScreen> {
  List<Procedure> _procedures = [];
  bool _showLoader = false;

  @override
  void initState() {
    super.initState();
    _getProcedures();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Procedimientos'),
      ),
      body: Center(
        child: _showLoader
            ? LoaderComponent(
                text: 'Por favor espere...',
              )
            : Text('Procedimientos'),
      ),
    );
  }

  void _getProcedures() async {
    setState(() {
      _showLoader = true;
    });

    var url = Uri.parse('${Constans.apiUrl}/api/Procedures');
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'bearer ${widget.token.token}',
      },
    );

    setState(() {
      _showLoader = false;
    });

    //print(response.body);

    var body = response.body;
    var decodedJson = jsonDecode(body);

    if (decodedJson != null) {
      for (var item in decodedJson) {
        _procedures.add(Procedure.fromJson(item));
      }
    }

    print(_procedures);
  }
}
