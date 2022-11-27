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
          : ListView.separated(
              itemCount: _userModel.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 5,
                color: Color.fromARGB(237, 8, 102, 29),
              ),
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Nome: ${_userModel[index].name}'),
                );
              },
            ),
    );
  }
}
