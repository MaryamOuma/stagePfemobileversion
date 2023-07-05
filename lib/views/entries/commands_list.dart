// import 'package:ecommerce_int2/app_properties.dart';
import 'package:flutter_project/models/command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/command_card.dart';

class CommandListPage extends StatefulWidget {
  @override
  _CommandListPageState createState() => _CommandListPageState();
}

class _CommandListPageState extends State<CommandListPage> {
  List<Command> commands = [
    Command(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Gadgets',
      '2',
    ),
    Command(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Clothes',
      '2',
    ),
    Command(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Fashion',
    '2',    ),
    Command(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Home',
    '2',    ),
    Command(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Beauty',
    '2',    ),
    Command(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Appliances',
    '2',    ),
  ];

  late List<Command> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = commands;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffF9F9F9),
      child: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Align(
              alignment: Alignment(-1, 0),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Command List',
                  style: TextStyle(
                    color: grey,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      fit: BoxFit.scaleDown,
                    )),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    List<Command> tempList = [];
                    commands.forEach((command) {
                      if (command.commandReference.toLowerCase().contains(value)) {
                        tempList.add(command);
                      }
                    });
                    setState(() {
                      searchResults.clear();
                      searchResults.addAll(tempList);
                    });
                    return;
                  } else {
                    setState(() {
                      searchResults.clear();
                      searchResults.addAll(commands);
                    });
                  }
                },
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: StaggeredCardCard(
                    begin: searchResults[index].begin,
                    end: searchResults[index].end,

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
