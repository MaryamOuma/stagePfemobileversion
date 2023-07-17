/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_tables/data_tables.dart';
import 'dart:math';
import '../../models/PurchaseOrder.dart';
import '../controllers/PurchaseOrderController.dart';
import '../views/bottom_navigation_helper.dart';
import '../views/navigation_drawer.dart';
class EntriesOrders extends GetView<PurchaseOrderController> {
  final PurchaseOrderController controller = Get.put(PurchaseOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('Purchase Orders'),
      ),
      bottomNavigationBar: handleBottomNavigationBar(0),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.purchaseOrders.length,
            itemBuilder: (context, index) {
              PurchaseOrder purchaseOrder = controller.purchaseOrders[index];
              return PurchaseOrderCard(
                purchaseOrder: purchaseOrder,
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
  PurchaseOrderCard({
    Key? key,
    required this.purchaseOrder,
  }) : super(key: key);
  @override
  _PurchaseOrderCardState createState() => _PurchaseOrderCardState();
}
class _PurchaseOrderCardState extends State<PurchaseOrderCard> {
  int _currentSortColumn = 0;
  bool _isAscending = true;
  int _rowsPerPage = 10; // Set the initial rows per page value
  int _currentPage = 0; // Track the current page index
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
            return a.price.compareTo(b.price);
          } else {
            return b.price.compareTo(a.price);
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
                  widget.purchaseOrder.commandReference,
                  style: TextStyle(
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
                          'To: ${widget.purchaseOrder.userName}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.purchaseOrder.userEmail}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.purchaseOrder.Date} ${widget.purchaseOrder.Time}',
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
            height: 270,
            child: NativeDataTable(
              columns: [
                DataColumn(
                  label: Text('Article'),
                  onSort: (columnIndex, ascending) =>
                      _sort(columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('Quantity'),
                  onSort: (columnIndex, ascending) =>
                      _sort(columnIndex, ascending),
                ),
                DataColumn(
                  label: Text('Subtotal'),
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
                    DataCell(Text(item.price.toString())),
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
*/