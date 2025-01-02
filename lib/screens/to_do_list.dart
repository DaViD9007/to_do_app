import 'package:flutter/material.dart';
import 'package:to_do_app/data/todo_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchToDoData();
  }

  Future<void> fetchToDoData() async {
    List<Map<String, dynamic>> todos = await getTodos();
    if (todos.isNotEmpty) {
      setState(() {
        titleController.text = todos[0]['title'];
        descriptionController.text = todos[0]['description'];        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),      
      body: summary(),
    );
  }

  

  Widget summary() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('todos').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No tasks available'));
        }

        final tasks = snapshot.data!.docs;

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(task['title']),
                subtitle: Text(task['description']),
                leading: Icon(Icons.check_box_outline_blank), // Checkbox icon
                trailing: Icon(Icons.more_vert), // Options menu
              ),
            );
          },
        );
      },
    );
  }
}
