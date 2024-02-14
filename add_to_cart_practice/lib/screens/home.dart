import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';
import '../constrains/color.dart';
import '../widgets/todo_item.dart';
import 'code.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeLogic _logic = HomeLogic();
  late TextEditingController _todoController;

  @override
  void initState() {
    super.initState();
    _logic.loadToDoList();
    _todoController = TextEditingController();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return Scaffold(
      // backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.lightbulb),
                onPressed: () {
                  // Toggle theme mode
                  Provider.of<ThemeChanger>(context, listen: false)
                      .toggleTheme();
                },
              ),
              const SizedBox(
                height: 45,
                width: 45,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1139613/pexels-photo-1139613.jpeg?auto=compress&cs=tinysrgb&w=600')),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      onChanged: _runFilter,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        prefixIcon: Icon(
                          Icons.search,
                          color: tdblack,
                          size: 20,
                        ),
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 20, minWidth: 25),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: tdGrey),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    child: const Text(
                      'All toDos',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _logic.foundToDo.length,
                    itemBuilder: (context, index) {
                      return ToDoItem(
                        todo: _logic.foundToDo[index],
                        onToDoChanged: (todo) {
                          setState(() {
                            _logic.handleTodoChange(todo);
                          });
                        },
                        onDeleteItem: (id) {
                          setState(() {
                            _logic.deleteToDoItem(id);
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 700),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                            hintText: 'Add a new todo',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: tdblue,
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            _logic.addToDoItem(
                                _todoController.text, _todoController);
                          });
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      _logic.runFilter(enteredKeyword);
    });
  }
}
