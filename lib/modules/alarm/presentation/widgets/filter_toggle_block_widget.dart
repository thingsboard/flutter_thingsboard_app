import 'package:flutter/material.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_filter_widget.dart';

class FilterToggleBlockWidget<T> extends StatefulWidget {
  const FilterToggleBlockWidget({
    required this.label,
    required this.items,
    required this.onSelectedChanged,
    required this.labelAtIndex,
    this.selected = const {},
    this.multiselect = true,
    super.key,
  });

  final String label;
  final List<T> items;
  final ValueChanged<List<T>> onSelectedChanged;
  final String Function(int) labelAtIndex;
  final Set<T> selected;
  final bool multiselect;

  @override
  State<StatefulWidget> createState() => _FilterToggleBlockWidgetState();
}

class _FilterToggleBlockWidgetState extends State<FilterToggleBlockWidget> {
  final selected = <dynamic>{};

  @override
  void initState() {
    selected.addAll(widget.selected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlarmFilterWidget(
      filterTitle: widget.label,
      child: Wrap(
        spacing: 8,
        children: List.generate(
          widget.items.length,
          (index) => FilledButton.icon(
            onPressed: () {
              setState(() {
                final element = widget.items[index];

                if (selected.contains(element)) {
                  selected.remove(element);
                } else {
                  selected.add(element);
                }
              });

              widget.onSelectedChanged(selected.toList());
            },
            label: Text(
              widget.labelAtIndex(index),
              style:
                  !selected.contains(widget.items[index])
                      ? TextStyle(
                        color: Colors.black.withValues(alpha: 0.38),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      )
                      : const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
            ),
            icon:
                !selected.contains(widget.items[index])
                    ? const SizedBox.shrink()
                    : const Icon(Icons.check),
            style: FilledButton.styleFrom(
              backgroundColor:
                  !selected.contains(widget.items[index])
                      ? Colors.black.withValues(alpha: 0.06)
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}
