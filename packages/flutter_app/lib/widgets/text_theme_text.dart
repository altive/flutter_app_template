import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

mixin TextThemeText implements Widget {
  /// The string to display.
  String get data;

  /// The text color.
  Color? get color;

  /// The indentation amount in spaces.
  double? get indent;

  /// The maximum number of lines. Null means unlimited.
  int? get maxLines;

  /// The text alignment.
  TextAlign? get textAlign;
}

/// [Text] widget with [TextTheme.displayLarge].
class DisplayLargeText extends StatelessWidget with TextThemeText {
  const DisplayLargeText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.displayLarge!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.displayMedium].
class DisplayMediumText extends StatelessWidget with TextThemeText {
  const DisplayMediumText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.displayMedium!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.displaySmall].
class DisplaySmallText extends StatelessWidget with TextThemeText {
  const DisplaySmallText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.displaySmall!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.headlineLarge].
class HeadlineLargeText extends StatelessWidget with TextThemeText {
  const HeadlineLargeText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.headlineLarge!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.headlineMedium].
class HeadlineMediumText extends StatelessWidget with TextThemeText {
  const HeadlineMediumText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.headlineMedium!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.headlineSmall].
class HeadlineSmallText extends StatelessWidget with TextThemeText {
  const HeadlineSmallText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.headlineSmall!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.titleLarge].
class TitleLargeText extends StatelessWidget with TextThemeText {
  const TitleLargeText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.titleLarge!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.titleMedium].
class TitleMediumText extends StatelessWidget with TextThemeText {
  const TitleMediumText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.titleMedium!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.titleSmall].
class TitleSmallText extends StatelessWidget with TextThemeText {
  const TitleSmallText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.titleSmall!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.bodyLarge].
class BodyLargeText extends StatelessWidget with TextThemeText {
  const BodyLargeText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.bodyLarge!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.bodyMedium].
class BodyMediumText extends StatelessWidget with TextThemeText {
  const BodyMediumText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.bodyMedium!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.bodySmall].
class BodySmallText extends StatelessWidget with TextThemeText {
  const BodySmallText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.bodySmall!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.labelLarge].
class LabelLargeText extends StatelessWidget with TextThemeText {
  const LabelLargeText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.labelLarge!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.labelMedium].
class LabelMediumText extends StatelessWidget with TextThemeText {
  const LabelMediumText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.labelMedium!.copyWith(color: color),
    );
  }
}

/// [Text] widget with [TextTheme.labelSmall].
class LabelSmallText extends StatelessWidget with TextThemeText {
  const LabelSmallText(
    this.data, {
    super.key,
    this.color,
    this.indent,
    this.maxLines,
    this.textAlign,
  });

  @override
  final String data;

  @override
  final Color? color;

  @override
  final double? indent;

  @override
  final int? maxLines;

  @override
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return _TextThemeText(
      data,
      color: color,
      indent: indent,
      maxLines: maxLines,
      textAlign: textAlign,
      style: context.textTheme.labelSmall!.copyWith(color: color),
    );
  }
}

class _TextThemeText extends StatelessWidget {
  const _TextThemeText(
    this.data, {
    required this.color,
    required this.indent,
    required this.maxLines,
    required this.textAlign,
    required this.style,
  });

  final String data;
  final Color? color;
  final double? indent;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: indent ?? 0),
      child: Text(
        data,
        maxLines: maxLines,
        overflow: maxLines == null ? null : TextOverflow.ellipsis,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
