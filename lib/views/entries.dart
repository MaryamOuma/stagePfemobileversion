import 'dart:math';

import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';

class Entries extends StatelessWidget {
  final BottomNavigationBar bottomNavigationBar;

  const Entries({Key? key, required this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Entries Commands'),
        backgroundColor: Colors.blue.shade700,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                CommandCard(
                  commandReference: 'Command 1',
                  dateOfCreation: '2023-06-19',
                  articlesCount: 5,
                  userName: 'John Doe',
                ),
                SizedBox(height: 16.0),
                CommandCard(
                  commandReference: 'Command 2',
                  dateOfCreation: '2023-06-18',
                  articlesCount: 3,
                  userName: 'Jane Smith',
                ),
                SizedBox(height: 16.0),
                CommandCard(
                  commandReference: 'Command 3',
                  dateOfCreation: '2023-06-17',
                  articlesCount: 8,
                  userName: 'Mike Johnson',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                color: Colors.transparent,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) => AddCommandModal(),
                    );
                  },
                  backgroundColor: Colors.blue,
                  icon: const Icon(Icons.add),
                  label: const Text('Create Command'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommandCard extends StatelessWidget {
  final String commandReference;
  final String dateOfCreation;
  final int articlesCount;
  final String userName;

  const CommandCard({
    Key? key,
    required this.commandReference,
    required this.dateOfCreation,
    required this.articlesCount,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final color = Color.fromARGB(255, 169, 192, 240);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
            image: AssetImage('commands-back.jpg'),
            fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(4, 6),
            blurRadius: 4.0,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            child: Text(
              commandReference,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'YourDesiredFont',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date of Creation: $dateOfCreation',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Articles Count: $articlesCount',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'User Name: $userName',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Button action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'YourDesiredFont',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddCommandModal extends StatefulWidget {
  @override
  _AddCommandModalState createState() => _AddCommandModalState();
}

class _AddCommandModalState extends State<AddCommandModal> {
  List<CommandRow> commandRows = [CommandRow()];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Command',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: commandRows.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        commandRows.removeAt(index);
                      });
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: commandRows[index],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      commandRows.add(CommandRow());
                    });
                  },
                  child: Text('Add Article'),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    // Save button action
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommandRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: DropdownButtonFormField<String>(
            items: const [
              DropdownMenuItem(value: 'Article 1', child: Text('Article 1')),
              DropdownMenuItem(value: 'Article 2', child: Text('Article 2')),
              DropdownMenuItem(value: 'Article 3', child: Text('Article 3')),
            ],
            onChanged: (value) {
              // Dropdown selection action
            },
            decoration: const InputDecoration(
              labelText: 'Article',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          flex: 3,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () {
              // Remove row action
            },
          ),
        ),
      ],
    );
  }
}