import 'package:flutter/material.dart';

void showEditDialog(
    BuildContext context,
    String title,
    String initialValue,
    Function(String) onSave,
    ) {
  TextEditingController controller =
  TextEditingController(text: initialValue);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Edit $title"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Enter $title",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(controller.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}