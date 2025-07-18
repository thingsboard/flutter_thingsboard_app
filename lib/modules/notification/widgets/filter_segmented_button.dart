import 'package:flutter/material.dart';

class FilterSegmentedButton<T> extends StatelessWidget {
  FilterSegmentedButton({
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
    super.key,
  });

  final List<FilterSegments> segments;
  final T selected;
  final void Function(T) onSelectionChanged;

  final selectedTextStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  final unselectedTextStyle = TextStyle(
    color: Colors.black.withValues(alpha: 0.38),
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black.withValues(alpha: 0.06),
      ),
      height: 32,
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          segments.length,
          (index) => Expanded(
            child: InkWell(
              onTap: () => onSelectionChanged(segments[index].value as T),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color:
                      segments[index].value == selected
                          ? Theme.of(context).primaryColor
                          : null,
                ),
                child: Center(
                  child: Text(
                    segments[index].label,
                    style:
                        segments[index].value == selected
                            ? selectedTextStyle
                            : unselectedTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class FilterSegments<T> {
  const FilterSegments({required this.label, required this.value});

  final String label;
  final T value;
}
