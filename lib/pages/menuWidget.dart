import 'package:flutter/material.dart';

class CafeMenuLists extends StatefulWidget {
  final List<String> categories;
  final Map<String, List<String>> menuItems;

  CafeMenuLists({required this.categories, required this.menuItems});

  @override
  _CafeMenuListsState createState() => _CafeMenuListsState();
GlobalKey<FormState> formKey = GlobalKey<FormState>();


}

class _CafeMenuListsState extends State<CafeMenuLists> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(widget.categories[index]),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.menuItems[widget.categories[index]]!.length,
              itemBuilder: (context, index2) {
                return ListTile(
                  title: Text(widget.menuItems[widget.categories[index]]![index2]),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
