import 'package:flutter/material.dart';

import 'repository/todo_Repository.dart';
import 'todoModel.dart';
import 'todo_controller.dart';

class HttpListScreens extends StatelessWidget {
  const HttpListScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// dependency injection
    var todoController = TodoController(TodoRepository());

    /// test
    todoController.fetchTodoList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Http + get,post,delete,patch,put"),

        /// get- alamk
        /// post - yayınlamak
        /// delete - silmek
        /// patch - yama(güncelleme)
        /// put -
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                var todo = snapshot.data?[index];
                return Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("${todo?.id}"),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text("${todo?.title}"),
                        flex: 3,
                      ),
                      Expanded(
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            InkWell(
                              child: buildCallContainer(
                                  'patch', Colors.orange.shade200),
                              onTap: () {
                                todoController
                                    .updatePatchCompleted(todo!)
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 500),
                                      backgroundColor: Colors.green,
                                      content: Text("$value"),
                                    ),
                                  );
                                });
                              },
                            ),
                            InkWell(
                              child: buildCallContainer(
                                  'put', Colors.blue.shade200),
                              onTap: () {
                                todoController.updatePutCompleted(todo!);
                              },
                            ),
                            InkWell(
                              child: buildCallContainer(
                                  'del', Colors.pink.shade200),
                              onTap: () {
                                todoController.deleteTodo(todo!).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("$value \+ Silindi"),
                                      duration: Duration(milliseconds: 500),
                                    ),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (contex, index) {
                return Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline_outlined),
        onPressed: () {
          Todo todo = Todo(userId: 3, title: 'sample post', completed: false);
          todoController.postTodo(todo);
        },
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  Widget buildCallContainer(String title, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text(title)),
    );
  }
}
