import 'package:flutter/material.dart';

typedef OnRowSelect = void Function(int index);

class ProjectDataTableSource extends DataTableSource {
  ProjectDataTableSource({
    List<Map<String, String>>? data,
    this.onRowSelect,
  })  : _data = data,
        assert(data != null);

  List<Map<String, String>>? _data;
  OnRowSelect? onRowSelect;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);

    if (index >= _data!.length) {
      return null;
    }
    final _pdata = _data![index];

    return DataRow.byIndex(
      index: index, // DONT MISS THIS
      cells: <DataCell>[
        DataCell(Container(width: 30, child: Text('${_pdata["id"]}'))),
        DataCell(Container(width: 500, child: Text('${_pdata["assignment_name"]}')), placeholder: true),
        DataCell(Container(width: 100, child: Text('${_pdata["client_name"]}'))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data!.length;

  @override
  int get selectedRowCount => 0;

  /*
   *
   * Sorts this list according to the order specified by the [compare] function.

    The [compare] function must act as a [Comparator].

    List<String> numbers = ['two', 'three', 'four'];
// Sort from shortest to longest.
    numbers.sort((a, b) => a.length.compareTo(b.length));
    print(numbers);  // [two, four, three]
    The default List implementations use [Comparable.compare] if [compare] is omitted.

    List<int> nums = [13, 2, -11];
    nums.sort();
    print(nums);  // [-11, 2, 13] 
   */
  void sort<T>(Comparable<T> Function(Map<String, String> d) getField, bool ascending) {
    _data!.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });

    notifyListeners();
  }
}
