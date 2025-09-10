import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final void Function(TimeOfDay) onTimeSelected;

  const CustomTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeSelected,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    selectedHour = widget.initialTime.hour;
    selectedMinute = widget.initialTime.minute;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    scrollController:
                        FixedExtentScrollController(initialItem: selectedHour),
                    itemExtent: 40,
                    onSelectedItemChanged: (value) {
                      setState(() => selectedHour = value);
                    },
                    children: List.generate(24, (i) => Center(child: Text('$i'))),
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                        initialItem: selectedMinute),
                    itemExtent: 40,
                    onSelectedItemChanged: (value) {
                      setState(() => selectedMinute = value);
                    },
                    children:
                        List.generate(60, (i) => Center(child: Text(i.toString().padLeft(2, '0')))),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              widget.onTimeSelected(TimeOfDay(
                hour: selectedHour,
                minute: selectedMinute,
              ));
              Navigator.pop(context);
            },
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}
