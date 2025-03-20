import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

void main() => runApp(MyApp());

// ignore: public_member_api_docs
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String description = 'My great package';
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Theme(
        data: ThemeData(
          primaryColor: const Color(0xFF2C1C6B),
          colorScheme:
              ColorScheme.light().copyWith(secondary: const Color(0xFF200681)),
          cardColor: const Color(0xFFF8F9FC),
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontSize: 20, color: Color(0xFF2C1C6B))),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('EditableTextInput'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        MarkdownTextInput(
                          (String value) => setState(() => description = value),
                          description,
                          label: 'Description',
                          maxLines: 10,
                          actions: MarkdownType.values,
                          controller: controller,
                          textStyle: TextStyle(fontSize: 16),
                          optionnalActionButtons: [
                            ActionButton(
                                widget: Icon(Icons.add),
                                action: () => controller.text =
                                    '${controller.text} test ')
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            controller.clear();
                          },
                          child: Text('Clear'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: MarkdownBody(
                            data: description,
                            shrinkWrap: true,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
