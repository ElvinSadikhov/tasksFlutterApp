import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/models/task.dart';
import 'package:flutter_tasks_app/ui/widgets/task_tile.dart';

import '../../consts/app_strings.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isExpanded) => TastTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(children: [
                        const TextSpan(
                            text: "${AppStrings.title}\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.title),
                        const TextSpan(
                            text: "\n\n${AppStrings.desctiption}\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.description),
                      ]),
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
