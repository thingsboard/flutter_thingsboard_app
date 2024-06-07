import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/modules/alarm/domain/entities/filter_data_entity.dart';
import 'package:thingsboard_app/modules/alarm/presentation/widgets/filter_toggle_block_widget.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class AlarmsFilterPage extends TbContextWidget {
  AlarmsFilterPage(super.tbContext, {super.key});

  @override
  State<StatefulWidget> createState() => _AlarmsFilterPageState();
}

class _AlarmsFilterPageState extends TbContextState<AlarmsFilterPage> {
  final list = const [
    FilterDataEntity(label: 'Active', data: AlarmSearchStatus.ACTIVE),
    FilterDataEntity(label: 'Cleared', data: AlarmSearchStatus.CLEARED),
    FilterDataEntity(label: 'Acknowledged', data: AlarmSearchStatus.ACK),
    FilterDataEntity(label: 'Unacknowledged', data: AlarmSearchStatus.UNACK),
  ];

  final list2 = const [
    FilterDataEntity(label: 'Critical', data: AlarmSeverity.CRITICAL),
    FilterDataEntity(label: 'Major', data: AlarmSeverity.MAJOR),
    FilterDataEntity(label: 'Minor', data: AlarmSeverity.MINOR),
    FilterDataEntity(label: 'Warning', data: AlarmSeverity.WARNING),
    FilterDataEntity(label: 'Indeterminate', data: AlarmSeverity.INDETERMINATE),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TbAppBar(
        tbContext,
        title: const Text('Filters'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterToggleBlockWidget(
                label: 'Alarm status list',
                items: list,
                selected: const {0},
                onSelectedChanged: (values) {},
                labelAtIndex: (index) => list[index].label,
              ),
              const SizedBox(height: 12),
              FilterToggleBlockWidget(
                label: 'Alarm severity list',
                items: list2,
                onSelectedChanged: (values) {},
                labelAtIndex: (index) => list2[index].label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
