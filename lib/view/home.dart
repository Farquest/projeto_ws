// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:projeto_ws/model/user_model.dart';
import 'package:projeto_ws/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModel> _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API - CPU 2022'),
        backgroundColor: const Color.fromARGB(237, 8, 102, 29),
      ),
      backgroundColor: const Color.fromARGB(255, 22, 207, 62),
      body: _userModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: Text('Nome: ${_userModel[index].name}'),
                    tileColor: const Color.fromARGB(200, 8, 102, 29),
                  ),
                );
              },
            ),
    );
  }
}
