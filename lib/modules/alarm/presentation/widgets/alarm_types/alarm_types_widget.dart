import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/generated/l10n.dart';
import 'package:thingsboard_app/locator.dart';
import 'package:thingsboard_app/modules/alarm/presentation/bloc/alarm_types/bloc.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_filter_widget.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/alarm_types/types_list_widget.dart';
import 'package:thingsboard_app/utils/ui/ui_utils.dart';

class AlarmTypesWidget extends StatelessWidget {
  const AlarmTypesWidget({
    required this.tbContext,
    required this.onChanged,
    super.key,
  });

  final TbContext tbContext;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return AlarmFilterWidget(
      filterTitle: S.of(context).alarmTypeList,
      child: Container(
        constraints: const BoxConstraints(minHeight: 38),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withValues(alpha: 0.12)),
          borderRadius: BorderRadius.circular(4),
        ),
        width: double.infinity,
        child: BlocBuilder<AlarmTypesBloc, AlarmTypesState>(
          builder: (context, state) {
            switch (state) {
              case AlarmTypesSelectionEmptyState():
                return InkWell(
                  onTap: () {
                    UiUtils.showModalBottomSheet(
                      context: context,
                      topControl: const SizedBox.shrink(),
                      builder:
                          (context) => AnimatedSize(
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 500),
                            child: TypesListWidget(
                              tbContext: tbContext,
                              onChanged: onChanged,
                            ),
                          ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          S.of(context).anyType,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withValues(alpha: 0.38),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              case AlarmTypeSelectedState():
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ...List.generate(
                        state.selectedTypes.length,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withValues(alpha: 0.04),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  state.selectedTypes.elementAt(index),
                                  style: TextStyle(
                                    color: Colors.black.withValues(alpha: 0.87),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  getIt<AlarmTypesBloc>().add(
                                    AlarmTypesRemoveSelectedEvent(
                                      type: state.selectedTypes.elementAt(
                                        index,
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.close,
                                  color: Colors.black.withValues(alpha: 0.54),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: state.allowToAddMore,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            UiUtils.showModalBottomSheet(
                              context: context,
                              topControl: const SizedBox.shrink(),
                              builder:
                                  (context) => TypesListWidget(
                                    tbContext: tbContext,
                                    onChanged: onChanged,
                                  ),
                            );
                          },
                          child: Text(
                            S.of(context).plusAlarmType,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withValues(alpha: 0.38),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
