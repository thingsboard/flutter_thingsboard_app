import 'package:flutter/material.dart';
import 'package:thingsboard_app/config/themes/design_tokens.dart';
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
  final Set<T> items;
  final ValueChanged<Set<T>> onSelectedChanged;
  final String Function(int) labelAtIndex;
  final Set<T> selected;
  final bool multiselect;

  @override
  State<StatefulWidget> createState() => _FilterToggleBlockWidgetState<T>();
}

class _FilterToggleBlockWidgetState<T> extends State<FilterToggleBlockWidget<T>> {
  final selected = <T>{};

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
runSpacing: 8,
        spacing: 8,
        children: List.generate(
          widget.items.length,
          (index) => FilledButton.icon(
            onPressed: () {
              setState(() {
                final element = widget.items.elementAt(index);

                if (selected.contains(element)) {
                  selected.remove(element);
                } else {
                  selected.add(element);
                }
              });

              widget.onSelectedChanged(selected);
            },
            label: Text(
              widget.labelAtIndex(index),
              style:
                  !selected.contains(widget.items.elementAt(index))
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
                !selected.contains(widget.items.elementAt(index))
                    ? const SizedBox.shrink()
                    : const Icon(Icons.check),
            style: FilledButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.only(top: 6,bottom: 6, left: 12, right: 24),
              minimumSize: const Size(0, DesignTokens.buttonHeightSmall),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor:
                  !selected.contains(widget.items.elementAt(index))
                      ? Colors.black.withValues(alpha: 0.06)
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}
