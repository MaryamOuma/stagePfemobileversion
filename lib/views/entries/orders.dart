import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:get/get.dart';
import 'package:data_tables/data_tables.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:excel/excel.dart';
import '../../../models/PurchaseOrder.dart';
import '../../controllers/PurchaseOrderController.dart';
import '../bottom_navigation_helper.dart';
import '../navigation_drawer.dart';
import 'package:pdf/widgets.dart' as pw;

class Orders extends GetView<PurchaseOrderController> {
  final PurchaseOrderController controller = Get.put(PurchaseOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text('purchase_orders'.tr),
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
      bottomNavigationBar: createEntriesBottomNavigationBar(1),
      body: Obx(
        () {
          print('building list view');
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

  PurchaseOrderCard({
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
                      'Date: ${DateFormat('yyyy-MM-dd').format(widget.purchaseOrder.createdAt)}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Time: ${DateFormat('HH:mm').format(widget.purchaseOrder.createdAt)}',
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
            height: 320,
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
                    generateExcel(widget.purchaseOrder);
                  },
                  icon: Icon(Icons.file_download),
                ),
                SizedBox(width: 16.0),
                IconButton(
                  onPressed: () {
                    generatePdf();
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

  void generateExcel(PurchaseOrder purchaseOrder) {
    var excel = Excel.createExcel();

    var sheet = excel['Sheet1'];

    // Add header for command reference
    sheet.appendRow(['Command Reference: ${purchaseOrder.code}']);

    // Add header for date and time
    sheet.appendRow(
        ['Date: ${DateFormat('yyyy-MM-dd').format(purchaseOrder.createdAt)}']);
    sheet.appendRow(
        ['Time: ${DateFormat('HH:mm').format(purchaseOrder.createdAt)}']);

    // Add header for made by
    sheet.appendRow(['Made By: ${purchaseOrder.user_name}']);

    // Add spacing row
    sheet.appendRow([]);

    // Add headers for data
    sheet.appendRow(['Article', 'Quantity', 'SubTotal']);

    // Add data rows
    for (var item in purchaseOrder.items) {
      sheet.appendRow([item.article, item.quantity, item.subtotal]);
    }

    // Save the Excel file to a file
    var excelPath = 'path_to_save_excel_file.xlsx';
    File(excelPath).writeAsBytesSync(excel.save()!); // Add the ! operator here

    print('Excel generated: $excelPath');
  }

  void generatePdf() {
    // Create a PDF document
    final pdf = pw.Document();

    // Add content to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Add your content here, similar to what you have in your Card widget
              pw.Text('Order Reference: ${widget.purchaseOrder.code}'),
              pw.Text('Made By: ${widget.purchaseOrder.user_name}'),
              pw.Text(
                  'Date: ${DateFormat('yyyy-MM-dd').format(widget.purchaseOrder.createdAt)}'),
              pw.Text(
                  'Time: ${DateFormat('HH:mm').format(widget.purchaseOrder.createdAt)}'),
              // Add other content as needed
            ],
          );
        },
      ),
    );

    // Save the PDF as bytes asynchronously
    pdf.save().then((Uint8List pdfBytes) {
      // Save the PDF to a file without blocking the main thread
      final File pdfFile = File('purchase_order.pdf');
      pdfFile.writeAsBytes(pdfBytes).then((_) {
        // Show a message indicating the PDF is saved
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF file saved'),
          ),
        );
      }).catchError((error) {
        print('Error saving PDF: $error');
      });
    }).catchError((error) {
      print('Error generating PDF: $error');
    });
  }
}
