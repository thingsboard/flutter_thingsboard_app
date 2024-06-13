import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_filter_widget.dart';

class FilterToggleBlockWidget<T> extends StatefulWidget {
  const FilterToggleBlockWidget({
    required this.label,
    required this.items,
    required this.onSelectedChanged,
    required this.labelAtIndex,
    this.selected,
    this.multiselect = true,
    super.key,
  });

  final String label;
  final List<T> items;
  final ValueChanged<Set<T>> onSelectedChanged;
  final String Function(int) labelAtIndex;
  final Set<int>? selected;
  final bool multiselect;

  @override
  State<StatefulWidget> createState() => _FilterToggleBlockWidgetState();
}

class _FilterToggleBlockWidgetState extends State<FilterToggleBlockWidget> {
  final selected = <int>{};

  @override
  void initState() {
    selected.addAll(widget.selected ?? {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlarmFilterWidget(
      filterTitle: widget.label,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(
          widget.items.length,
          (index) => FilledButton.icon(
            onPressed: () {
              setState(() {
                if (selected.contains(index)) {
                  selected.remove(index);
                } else {
                  selected.add(index);
                }
              });
            },
            label: Text(
              widget.labelAtIndex(index),
              style: !selected.contains(index)
                  ? TextStyle(
                      color: Colors.black.withOpacity(0.38),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    )
                  : const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
            ),
            icon: !selected.contains(index)
                ? const SizedBox.shrink()
                : const Icon(Icons.check),
            style: FilledButton.styleFrom(
              backgroundColor: !selected.contains(index)
                  ? Colors.black.withOpacity(0.06)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
