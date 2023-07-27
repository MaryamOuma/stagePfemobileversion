import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/notification_controller.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:get/get.dart';
import 'package:data_tables/data_tables.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../../models/Invoice.dart';
import '../navigation_drawer.dart';

class EntriesInvoicesTopay extends GetView<NotificationController> {
  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('invoices'.tr),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xffE99E22),
                blue,
                grey,
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          final data = controller.notificationData.value;
          return ListView.builder(
            itemCount: data.entriesinvoicesTopay?.length,
            itemBuilder: (context, index) {
              Invoice invoice = data.entriesinvoicesTopay![index];
              // print('Command at index $index: $invoice');
              return PurchaseOrderCard(
                invoice: invoice,
                itemsLength: invoice.items.length,
              );
            },
          );
        },
      ),
    );
  }
}

class PurchaseOrderCard extends StatefulWidget {
  final Invoice invoice;
  final int itemsLength;

  PurchaseOrderCard({
    Key? key,
    required this.invoice,
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
        widget.invoice.items.sort((a, b) {
          if (ascending) {
            return a.article.compareTo(b.article);
          } else {
            return b.article.compareTo(a.article);
          }
        });
      } else if (columnIndex == 1) {
        // Sort by Quantity
        widget.invoice.items.sort((a, b) {
          if (ascending) {
            return a.quantity.compareTo(b.quantity);
          } else {
            return b.quantity.compareTo(a.quantity);
          }
        });
      } else if (columnIndex == 2) {
        // Sort by Subtotal
        widget.invoice.items.sort((a, b) {
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
    int maxPage = (widget.invoice.items.length - 1) ~/ _rowsPerPage;
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
        min(_rowsPerPage, widget.invoice.items.length - _rowsOffset);
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
                  'CommandReference: ${widget.invoice.commandReference}',
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
                          'Made By: ${widget.invoice.userName}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.invoice.userEmail}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Status :${widget.invoice.status}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Date: ${DateFormat('yyyy-MM-dd').format(widget.invoice.date)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Time: ${DateFormat('HH:mm').format(widget.invoice.date)}',
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
                      color: Colors.blue, // Replace with your desired color
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
                      color: Colors.blue, // Replace with your desired color
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
                      color: Colors.blue, // Replace with your desired color
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Subtotal',
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
              rows: widget.invoice.items
                  .getRange(
                      _rowsOffset,
                      min(_rowsOffset + _rowsPerPage,
                          widget.invoice.items.length))
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
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  '${widget.invoice.Total} DH',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Remaining Amount:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  '${widget.invoice.RemainingAmount} DH',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red[300],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
                    generateExcel();
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

  void generateExcel() {
    var excel = Excel.createExcel();

    var sheet = excel['Sheet1'];

    // Add header for command reference
    sheet.appendRow(['Command Reference: ${widget.invoice.commandReference}']);

    // Add header for date and time
    sheet.appendRow(
        ['Date: ${DateFormat('yyyy-MM-dd').format(widget.invoice.date)}']);
    sheet.appendRow(
        ['Time: ${DateFormat('HH:mm').format(widget.invoice.date)}']);

    // Add header for made by
    sheet.appendRow(['Made By: ${widget.invoice.userName}']);

    // Add spacing row
    sheet.appendRow([]);
    sheet.appendRow(['Status: ${widget.invoice.status}']);
    sheet.appendRow([]);

    // Add headers for data
    sheet.appendRow(['Article', 'Quantity', 'SubTotal']);

    // Add data rows
    for (var item in widget.invoice.items) {
      sheet.appendRow([item.article, item.quantity, item.subtotal]);
    }
    sheet.appendRow([]);
    sheet.appendRow(['Total Amount Paid: ${widget.invoice.Total}']);
    sheet.appendRow([]);
    sheet.appendRow(['Remaining Amount: ${widget.invoice.RemainingAmount}']);

    // Save the Excel file to a file
    var excelPath = 'path_to_save_excel_file.xlsx';
    File(excelPath).writeAsBytesSync(excel.save()!); // Add the ! operator here

    print('Excel generated: $excelPath');
  }
}
