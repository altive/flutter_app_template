import 'package:flutter/material.dart';

class TextInputPage extends StatefulWidget {
  // ----------------------------------------
  // Constructor
  // ----------------------------------------
  const TextInputPage({
    this.title,
    this.labelText,
    this.initialText,
    this.placeholder,
    this.helperText = '前の画面に戻ると保存されます。',
    this.maxLength = 400,
    this.maxLines = 14,
    this.minLines = 7,
  });

  // ----------------------------------------
  // Field
  // ----------------------------------------
  final String? title;
  final String? labelText;
  final String? initialText;
  final String? placeholder;
  final String helperText;
  final int maxLength;
  final int maxLines;
  final int minLines;

  @override
  _TextInputPageState createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  // ----------------------------------------
  // Field
  // ----------------------------------------
  String? _inputedText;

  // ----------------------------------------
  // Methods
  // ----------------------------------------
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(_inputedText ?? widget.initialText);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? ''),
        ),
        body: SafeArea(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.9,
              child: TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: widget.placeholder,
                  helperText: widget.helperText,
                  labelText: widget.labelText,
                ),
                maxLength: widget.maxLength,
                maxLines: widget.maxLines,
                minLines: widget.minLines,
                initialValue: widget.initialText,
                onChanged: (text) => _inputedText = text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
