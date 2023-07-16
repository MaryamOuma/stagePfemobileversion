import 'dart:math';

import 'package:data_tables/data_tables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/EntriesController.dart';
import '../../models/Command.dart';
import '../bottom_navigation_helper.dart';
import '../navigation_drawer.dart';

class DetailScreen extends StatefulWidget {
  final int commandId;

  const DetailScreen({
    Key? key,
    required this.commandId,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  int _currentSortColumn = 0;
  bool _isAscending = true;
  int _currentPage = 0; // Track the current page index
  final double rowHeight = 250;
  late int _rowsPerPage;
  late Command command; // Add this line to hold the fetched command
  final EntriesController controller = Get.put(EntriesController());
  late Future<Command> _commandFuture;
  Command? _command;

  @override
  void initState() {
    super.initState();

    _commandFuture = controller.fetchCommand(widget.commandId);
    // Wait for the command to be fetched and update the command variable
    _commandFuture.then((command) {
      setState(() {
        _command = command;
      });
    });
    _rowsPerPage = 2;
  }

  void _sort<T>(int columnIndex, bool ascending) {
    setState(() {
      _currentSortColumn = columnIndex;
      _isAscending = ascending;

      if (columnIndex == 0) {
        // Sort by Article
        _command!.items!.sort((a, b) {
          if (ascending) {
            return a.article.compareTo(b.article);
          } else {
            return b.article.compareTo(a.article);
          }
        });
      } else if (columnIndex == 1) {
        // Sort by Quantity
        _command!.items!.sort((a, b) {
          if (ascending) {
            return a.quantity.compareTo(b.quantity);
          } else {
            return b.quantity.compareTo(a.quantity);
          }
        });
      } else if (columnIndex == 2) {
        // Sort by Subtotal
        _command!.items!.sort((a, b) {
          if (ascending) {
            return a.subtotal.compareTo(b.subtotal);
          } else {
            return b.subtotal.compareTo(a.subtotal);
          }
        });
      }
    });
  }

  void _onRowsPerPageChanged(int? value) {
    setState(() {
      _rowsPerPage = value ?? _rowsPerPage;
      _currentPage = 0; // Reset the current page index
    });
  }

  void _handleNext() {
    int maxPage = (_command!.items!.length - 1) ~/ _rowsPerPage;
    if (_currentPage < maxPage) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _handlePrevious() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int _rowsOffset = _currentPage * _rowsPerPage;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: handleBottomNavigationBar(0),
      body: SingleChildScrollView(
        // Wrap the Column in SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'command',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    ),
                    child: SizedBox(
                      height: screenHeight / 3.2,
                      width: screenWidth,
                      child: Image.asset(
                        "images/details.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight / 9.8,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '${_command?.userName ?? ''}:<${_command?.userEmail ?? ''}>',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              ' ${_command?.userProfile ?? ''}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.business,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(width: 5),
                            Text(
                              ' ${_command?.department ?? ''}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 20,
              ),
              child: Text(
                'Command ${_command?.code ?? ''}',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 20),
                  child: Icon(
                    Icons.supervisor_account,
                    color: Color.fromARGB(255, 146, 137, 137),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${_command?.supplier ?? ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 20),
                  child: Icon(
                    Icons.category,
                    color: Color.fromARGB(255, 146, 137, 137),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '${_command?.family ?? ''}',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    Expanded(
                      child: FutureBuilder<Command>(
                        future: _commandFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            final command = snapshot.data!;
                            return NativeDataTable(
                              columns: [
                                DataColumn(
                                  label: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue[
                                          300], // Replace with your desired color
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Article',
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Replace with the desired text color
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onSort: (columnIndex, ascending) =>
                                      _sort(columnIndex, ascending),
                                ),
                                DataColumn(
                                  label: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue[
                                          300], // Replace with your desired color
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Quantity',
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Replace with the desired text color
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onSort: (columnIndex, ascending) =>
                                      _sort(columnIndex, ascending),
                                ),
                                DataColumn(
                                  label: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blue[
                                          300], // Replace with your desired color
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'SubTotal',
                                      style: TextStyle(
                                        color: Colors
                                            .white, // Replace with the desired text color
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onSort: (columnIndex, ascending) =>
                                      _sort(columnIndex, ascending),
                                ),
                              ],
                              sortColumnIndex: _currentSortColumn,
                              sortAscending: _isAscending,
                              rows: command.items!
                                  .getRange(
                                      _rowsOffset,
                                      min(_rowsOffset + _rowsPerPage,
                                          command.items!.length))
                                  .map<DataRow>((item) {
                                return DataRow(
                                  cells: [
                                    DataCell(Text(item.article)),
                                    DataCell(Text(item.quantity.toString())),
                                    DataCell(Text(item.subtotal.toString())),
                                  ],
                                );
                              }).toList(),
                            );
                          } else {
                            return Text('No data available');
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Rows per page: '),
                            DropdownButton<int>(
                              value: _rowsPerPage,
                              onChanged: (value) {
                                setState(() {
                                  _onRowsPerPageChanged(value!);
                                });
                              },
                              items:
                                  List<int>.generate(100, (index) => index + 1)
                                      .map((value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _handlePrevious,
                              icon: Icon(Icons.chevron_left),
                              //disabledColor: Colors.blue,
                            ),
                            Text('${_currentPage + 1}'),
                            IconButton(
                              onPressed: _handleNext,
                              icon: Icon(Icons.chevron_right),
                              //disabledColor: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
