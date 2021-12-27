import 'package:dropdown_search/dropdown_search.dart';

// ignore: unused_element
_dropdownSearch() {
  return DropdownSearch<String>(
    mode: Mode.BOTTOM_SHEET,
    items: [
      "Brazil",
      "Italia",
      "Tunisia",
      'Canada',
      'Zraoua',
      'France',
      'Belgique'
    ],
    onChanged: print,
    showSearchBox: true,
  );
}
