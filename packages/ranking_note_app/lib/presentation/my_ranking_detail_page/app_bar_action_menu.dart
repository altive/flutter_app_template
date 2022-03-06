enum AppBarActionMenu {
  preview,
  edit,
}

extension AppBarActionMenuExt on AppBarActionMenu {
  String get label {
    switch (this) {
      case AppBarActionMenu.preview:
        return 'Preview';
      case AppBarActionMenu.edit:
        return 'Edit';
    }
  }
}
