import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';

DropdownSearch_(String label, item) {
  return (Column(
    children: [
      SizedBox(height: 10),
      DropdownSearch<String>(
        mode: Mode.BOTTOM_SHEET,
        items: item,
        onChanged: print,
        showSearchBox: true,
      )
    ],
  ));
}
