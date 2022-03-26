/// ストック編集画面の編集モード
enum StockEditorMode {
  creationWithAmazon,
  creationWithPhoto,
  update,
  duplicate,
}

extension StockEditorModeExt on StockEditorMode {
  String get title {
    switch (this) {
      case StockEditorMode.creationWithAmazon:
        return 'ストック作成';

      case StockEditorMode.creationWithPhoto:
        return 'ストック作成';

      case StockEditorMode.update:
        return 'ストック編集';

      case StockEditorMode.duplicate:
        return 'ストック複製';
    }
  }

  bool get isCreaterFromAmazon => this == StockEditorMode.creationWithAmazon;
  bool get isCreaterFromPhoto => this == StockEditorMode.creationWithPhoto;
  bool get isUpdater => this == StockEditorMode.update;
  bool get isDuplicater => this == StockEditorMode.duplicate;
}

extension StockEditorModeNullableExt on StockEditorMode? {
  String? get title {
    if (this == null) {
      return null;
    }
    this!.title;
    return null;
  }

  bool get isCreaterFromAmazon => this == StockEditorMode.creationWithAmazon;
  bool get isCreaterFromPhoto => this == StockEditorMode.creationWithPhoto;
  bool get isUpdater => this == StockEditorMode.update;
  bool get isDuplicater => this == StockEditorMode.duplicate;
}
