import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconButtonsOnCell extends StatelessWidget {
  const IconButtonsOnCell({
    required this.isFavorited,
    required this.onPressedAddButton,
    required this.onPressedFavoriteButton,
    required this.onPressedAmazonButton,
    required this.onPressedShareButton,
  });

  final bool isFavorited;
  final void Function() onPressedAddButton;
  final void Function() onPressedFavoriteButton;
  final void Function() onPressedAmazonButton;
  final void Function() onPressedShareButton;

  static const iconSize = 20.0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(MdiIcons.plusBox),
          onPressed: onPressedAddButton,
          iconSize: iconSize,
        ),
        IconButton(
          icon: isFavorited
              ? const Icon(
                  MdiIcons.heart,
                  color: Colors.red,
                )
              : const Icon(MdiIcons.heartOutline),
          onPressed: onPressedFavoriteButton,
          iconSize: iconSize,
        ),
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.amazon),
          onPressed: onPressedAmazonButton,
          iconSize: iconSize,
        ),
        IconButton(
          icon: Icon(Platform.isIOS ? Icons.ios_share : Icons.share),
          onPressed: onPressedShareButton,
          iconSize: iconSize,
        ),
      ],
    );
  }
}
