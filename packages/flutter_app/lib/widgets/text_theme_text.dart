import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

mixin TextThemeText implements Widget {
  /// 表示する文字列。
  String get data;

  /// 文字色。
  Color? get color;

  /// 字下げする空白数値。
  double? get indent;

  /// 最大行数。nullなら無制限。
  int? get maxLines;

  /// テキストの揃え方。
  TextAlign? get textAlign;
}

/// [TextTheme.displayLarge] の [Text] ウィジェット。
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
      style: context.textTheme.displayLarge!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.displayMedium] の [Text] ウィジェット。
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
      style: context.textTheme.displayMedium!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.displaySmall] の [Text] ウィジェット。
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
      style: context.textTheme.displaySmall!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.headlineLarge] の [Text] ウィジェット。
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
      style: context.textTheme.headlineLarge!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.headlineMedium] の [Text] ウィジェット。
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
      style: context.textTheme.headlineMedium!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.headlineSmall] の [Text] ウィジェット。
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
      style: context.textTheme.headlineSmall!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.titleLarge] の [Text] ウィジェット。
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
      style: context.textTheme.titleLarge!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.titleMedium] の [Text] ウィジェット。
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
      style: context.textTheme.titleMedium!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.titleSmall] の [Text] ウィジェット。
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
      style: context.textTheme.titleSmall!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.bodyLarge] の [Text] ウィジェット。
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
      style: context.textTheme.bodyLarge!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.bodyMedium] の [Text] ウィジェット。
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
      style: context.textTheme.bodyMedium!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.bodySmall] の [Text] ウィジェット。
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
      style: context.textTheme.bodySmall!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.labelLarge] の [Text] ウィジェット。
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
      style: context.textTheme.labelLarge!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.labelMedium] の [Text] ウィジェット。
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
      style: context.textTheme.labelMedium!.copyWith(
        color: color,
      ),
    );
  }
}

/// [TextTheme.labelSmall] の [Text] ウィジェット。
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
      style: context.textTheme.labelSmall!.copyWith(
        color: color,
      ),
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
