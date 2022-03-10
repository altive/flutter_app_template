/// Storageに存在する写真のバリエーション
enum StoragePhotoVariant {
  original,
  small,
  medium,
  large,
}

extension Ex on StoragePhotoVariant {
  /// 写真名の末尾につく名前
  String? get suffix {
    switch (this) {
      case StoragePhotoVariant.original:
        return '';
      case StoragePhotoVariant.small:
        return '_200x200';
      case StoragePhotoVariant.medium:
        return '_400x400';
      case StoragePhotoVariant.large:
        return '_600x600';
    }
  }
}
