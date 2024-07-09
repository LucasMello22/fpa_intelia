import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário'),
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0), // Espaçamento superior
          Center(
            child: CircleAvatar(
              radius: 50.0, // Tamanho do ícone
              backgroundImage: AssetImage('assets/character_icon.png'), // Substitua pelo caminho da sua imagem
            ),
          ),
          SizedBox(height: 20.0), // Espaçamento entre o ícone e a lista
          Expanded(
            child: TodoList(),
          ),
        ],
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Map<String, dynamic>> _tasks = [
    {'title': 'Introdução', 'status': 'Não Iniciada'},
    {'title': 'A inteligência Humana', 'status': 'Não Iniciada'},
    {'title': 'A inteligência Artificial', 'status': 'Não Iniciada'},
  ];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/tasks.json');
  }

  Future<void> _loadTasks() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        String contents = await file.readAsString();
        setState(() {
          _tasks = List<Map<String, dynamic>>.from(json.decode(contents));
        });
      }
    } catch (e) {
      // Se houver um erro ao ler o arquivo, usamos a lista padrão
      print("Erro ao ler o arquivo: $e");
    }
  }

  Future<void> _saveTasks() async {
    try {
      final file = await _localFile;
      String contents = json.encode(_tasks);
      await file.writeAsString(contents);
    } catch (e) {
      print("Erro ao escrever no arquivo: $e");
    }
  }

  void _updateTaskStatus(int index, String status) {
    setState(() {
      _tasks[index]['status'] = status;
    });
    _saveTasks();
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Concluído':
        return Colors.green;
      case 'Estudando':
        return Colors.yellow;
      case 'Não Iniciada':
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_tasks[index]['title']),
          trailing: GestureDetector(
            onTap: () {
              _showStatusDialog(index);
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _getStatusColor(_tasks[index]['status']),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  void _showStatusDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione o status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <String>['Concluído', 'Estudando', 'Não Iniciada']
                .map((String value) {
              return ListTile(
                title: Text(value),
                leading: Radio<String>(
                  value: value,
                  groupValue: _tasks[index]['status'],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _tasks[index]['status'] = newValue;
                      });
                      _saveTasks();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
