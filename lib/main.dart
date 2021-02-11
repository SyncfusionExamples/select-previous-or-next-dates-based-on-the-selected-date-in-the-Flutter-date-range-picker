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
  DateRangePickerController _controller;

  @override
  void initState() {
    _controller = DateRangePickerController();
    super.initState();
  }

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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    List<PickerDateRange> dateRanges, ranges;
    dateRanges = (args.value as List<PickerDateRange>);
    DateTime date = dateRanges[dateRanges.length - 1].startDate;
    if (_controller.selectedRanges != null) {
    _controller.selectedRanges.clear();
    ranges = _controller.selectedRanges;
    ranges.addAll(<PickerDateRange>[
      PickerDateRange(
          date.add(Duration(days: -3)), date.add(Duration(days: -1))),
      PickerDateRange(date.add(Duration(days: 1)), date.add(Duration(days: 3)))
    ]);
    _controller.selectedRanges = ranges;
    }
  }
}
