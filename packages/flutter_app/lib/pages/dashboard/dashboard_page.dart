import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageFileState = useState<XFile?>(null);
    final imageFile = imageFileState.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(
              onPressed: () async {
                final file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                imageFileState.value = file;
              },
              icon: CircleAvatar(
                radius: 40,
                foregroundImage:
                    imageFile == null ? null : FileImage(File(imageFile.path)),
                child: const Icon(size: 40, Icons.person),
              ),
            ),
            const Center(child: Text('Taro YAMADA')),
          ],
        ),
      ),
    );
  }
}
