import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(RangeSelection());

class RangeSelection extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RangeSelectionInPicker(),
    );
  }
}

class RangeSelectionInPicker extends StatefulWidget {
  @override
  RangeSelectionInPickerState createState() => RangeSelectionInPickerState();
}

class RangeSelectionInPickerState extends State<RangeSelectionInPicker> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card(
              margin: const EdgeInsets.fromLTRB(50, 150, 50, 100),
              child: SfDateRangePicker(
                  view: DateRangePickerView.month,
                  controller: _controller,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                      enableSwipeSelection: false),
                  selectionMode: DateRangePickerSelectionMode.multiRange,
                  onSelectionChanged: selectionChanged))
        ],
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    final List<PickerDateRange> dateRanges =
        (args.value as List<PickerDateRange>);
    final DateTime? date = dateRanges.isNotEmpty
        ? dateRanges[dateRanges.length - 1].startDate!
        : null;
    if (date != null &&
        _controller.selectedRanges != null &&
        dateRanges[dateRanges.length - 1].endDate == null) {
      _controller.selectedRanges = <PickerDateRange>[
        PickerDateRange(
            date.add(Duration(days: -3)), date.add(Duration(days: -1))),
        PickerDateRange(
            date.add(Duration(days: 1)), date.add(Duration(days: 3)))
      ];
    }
  }
}
