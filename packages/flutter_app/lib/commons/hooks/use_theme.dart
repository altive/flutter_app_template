import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ThemeData useTheme() => Theme.of(useContext());

TextTheme useTextTheme() => Theme.of(useContext()).textTheme;

ColorScheme useColorScheme() => Theme.of(useContext()).colorScheme;
