import 'package:flutter/material.dart' hide NavigationDrawer;
import 'package:flutter_project/views/navigation_drawer.dart';
import 'package:get/get.dart';
import 'package:data_tables/data_tables.dart';
import 'dart:math';

import '../models/purchaseOrder.dart';
import '../controllers/PurchaseOrderController.dart';
import 'bottom_navigation_helper.dart';
import 'navigation_drawer.dart';

import 'package:data_tables/data_tables.dart';

class Orders extends GetView<PurchaseOrderController> {
  @override
  final PurchaseOrderController controller = Get.put(PurchaseOrderController());

  Widget build(BuildContext context) {
    print('build started of orders');
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('purchase_orders'.tr),
      ),
      bottomNavigationBar: createEntriesBottomNavigationBar(1),
      body: Obx(
        () {
          print('building list view of PO');

          return ListView.builder(
            itemCount: controller.purchaseOrders.length,
            itemBuilder: (context, index) {
              PurchaseOrder purchaseOrder = controller.purchaseOrders[index];
              return PurchaseOrderCard(
                purchaseOrder: purchaseOrder,
                itemsLength: purchaseOrder.items.length,
              );
            },
          );
        },
      ),
    );
  }
}

class PurchaseOrderCard extends StatefulWidget {
  final PurchaseOrder purchaseOrder;
  final int itemsLength;

  const PurchaseOrderCard({
    Key? key,
    required this.purchaseOrder,
    required this.itemsLength,
  }) : super(key: key);

  @override
  _PurchaseOrderCardState createState() => _PurchaseOrderCardState();
}

class _PurchaseOrderCardState extends State<PurchaseOrderCard> {
  int _currentSortColumn = 0;
  bool _isAscending = true;
  int _currentPage = 0; // Track the current page index
  final double rowHeight = 250;
  late int _rowsPerPage; // Declare _rowsPerPage as a late variable

  @override
  void initState() {
    super.initState();
    _rowsPerPage = widget
        .itemsLength; // Set _rowsPerPage to the value passed from the widget
  }

  void _sort<T>(int columnIndex, bool ascending) {
    setState(() {
      _currentSortColumn = columnIndex;
      _isAscending = ascending;

      if (columnIndex == 0) {
        // Sort by Article
        widget.purchaseOrder.items.sort((a, b) {
          if (ascending) {
            return a.article.compareTo(b.article);
          } else {
            return b.article.compareTo(a.article);
          }
        });
      } else if (columnIndex == 1) {
        // Sort by Quantity
        widget.purchaseOrder.items.sort((a, b) {
          if (ascending) {
            return a.quantity.compareTo(b.quantity);
          } else {
            return b.quantity.compareTo(a.quantity);
          }
        });
      } else if (columnIndex == 2) {
        // Sort by Subtotal
        widget.purchaseOrder.items.sort((a, b) {
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
    int maxPage = (widget.purchaseOrder.items.length - 1) ~/ _rowsPerPage;
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
    int _rowsCount =
        min(_rowsPerPage, widget.purchaseOrder.items.length - _rowsOffset);
    double dataTableHeight = _rowsPerPage * rowHeight;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Reference: ${widget.purchaseOrder.code}',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Made By: ${widget.purchaseOrder.user_name}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${widget.purchaseOrder.user_email}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.purchaseOrder.createdAt}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: NativeDataTable(
              columns: [
                DataColumn(
                  label: Container(
                    decoration: BoxDecoration(
                      color:
                          Colors.blue[300], // Replace with your desired color
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Article',
                      style: TextStyle(
                        color:
                            Colors.white, // Replace with the desired text color
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
                      color:
                          Colors.blue[300], // Replace with your desired color
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Quantity',
                      style: TextStyle(
                        color:
                            Colors.white, // Replace with the desired text color
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
                      color:
                          Colors.blue[300], // Replace with your desired color
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'SubTotal',
                      style: TextStyle(
                        color:
                            Colors.white, // Replace with the desired text color
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
              rows: widget.purchaseOrder.items
                  .getRange(
                      _rowsOffset,
                      min(_rowsOffset + _rowsPerPage,
                          widget.purchaseOrder.items.length))
                  .map<DataRow>((item) {
                return DataRow(
                  cells: [
                    DataCell(Text(item.article)),
                    DataCell(Text(item.quantity.toString())),
                    DataCell(Text(item.subtotal.toString())),
                  ],
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    // Generate Excel
                  },
                  icon: Icon(Icons.file_download),
                ),
                SizedBox(width: 16.0),
                IconButton(
                  onPressed: () {
                    // Generate PDF
                  },
                  icon: Icon(Icons.picture_as_pdf),
                ),
              ],
            ),
          ),
          // Pagination
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
                        _onRowsPerPageChanged(value);
                      });
                    },
                    items: List<int>.generate(100, (index) => index + 1)
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
                    disabledColor: Colors.grey,
                  ),
                  Text('${_currentPage + 1}'),
                  IconButton(
                    onPressed: _handleNext,
                    icon: Icon(Icons.chevron_right),
                    disabledColor: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
