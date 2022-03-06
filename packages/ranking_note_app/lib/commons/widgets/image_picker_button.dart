import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

import '../hooks/use_localization.dart';

class ImagePickerButton extends HookWidget {
  const ImagePickerButton({
    Key? key,
    this.imageFile,
    this.imageUrl,
    this.radius = 40,
    required this.onImageChanged,
    required this.onImageRemoved,
  }) : super(key: key);

  final XFile? imageFile;
  final String? imageUrl;
  final double radius;
  final ValueChanged<XFile> onImageChanged;
  final VoidCallback onImageRemoved;

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    return InkWell(
      onTap: () async {
        final source = await showModalBottomSheet<ImageSource>(
          context: context,
          useRootNavigator: true,
          builder: (context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      l10n.titleChangePhoto,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  if (imageFile != null || imageUrl != null)
                    ListTile(
                      title: Text(l10n.buttonRemovePhoto),
                      leading: const Icon(Icons.delete),
                      onTap: () {
                        onImageRemoved();
                        Navigator.of(context).pop();
                      },
                    ),
                  ListTile(
                    title: Text(l10n.buttonTakeNewPhoto),
                    leading: const Icon(Icons.camera_alt),
                    onTap: () => Navigator.of(context).pop(ImageSource.camera),
                  ),
                  ListTile(
                    title: Text(l10n.buttonSelectNewPhoto),
                    leading: const Icon(Icons.photo),
                    onTap: () => Navigator.of(context).pop(ImageSource.gallery),
                  ),
                ],
              ),
            );
          },
        );
        if (source == null) {
          return;
        }
        final photo = await ImagePicker().pickImage(source: source);
        if (photo == null) {
          return;
        }
        onImageChanged(photo);
      },
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(radius / 2),
        ),
        color: Theme.of(context).inputDecorationTheme.fillColor,
        child: SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: () {
            if (imageFile != null) {
              return Image.file(File(imageFile!.path));
            }
            if (imageUrl != null) {
              return CachedNetworkImage(imageUrl: imageUrl!);
            }
            return Icon(
              Icons.camera_alt,
              color: Theme.of(context).hintColor,
            );
          }(),
        ),
      ),
    );
  }
}
