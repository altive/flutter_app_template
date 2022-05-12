import 'package:flutter/material.dart';

import 'loading_indicator.dart';

/// 複数選択項目から1つを選ぶ画面。項目を1つ選択すると元の画面に戻る
class SingleSelectableListPage extends StatefulWidget {
  // Constructor
  const SingleSelectableListPage({
    required this.values,
    required this.initialValue,
    this.pageTitle,
  });

  final List<String>? values;
  final String? initialValue;
  final String? pageTitle;

  // Field
  static const String routeName = '/single-selectable-list';

  @override
  _SingleSelectableListPageState createState() =>
      _SingleSelectableListPageState();
}

class _SingleSelectableListPageState extends State<SingleSelectableListPage> {
  /// 選択中
  String? _selectedValue;

  @override
  void initState() {
    super.initState();

    _selectedValue = widget.initialValue;
  }

  // Methods
  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      loading: false,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.pageTitle ?? '')),
        body: SafeArea(
          child: ListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemCount: widget.values!.length,
            itemBuilder: (_, index) => RadioListTile<String>(
              title: Text(widget.values![index]),
              value: widget.values![index],
              groupValue: _selectedValue,
              onChanged: (newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
                Navigator.of(context).pop(newValue);
              },
            ),
          ),
        ),
      ),
    );
  }
}
