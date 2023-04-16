import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/add_widget.dart';
import 'package:todo_app/widgets/bottom_bar.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});
  static const routeName = "/done_screen";

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height  -
                    74,
                child: ListView.builder(
                    itemCount: todoProvider.tasks.length,
                    itemBuilder: (context, index) {
                      if (todoProvider.tasks[index].isDone) {
                        return Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.check),
                              onPressed: () {
                                todoProvider
                                    .updateIsDone(todoProvider.tasks[index]);
                              },
                            ),
                            Text(todoProvider.tasks[index].toDo),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
            ),
            const BottomBar()
          ],
        ),
      ),
    );
  }
}