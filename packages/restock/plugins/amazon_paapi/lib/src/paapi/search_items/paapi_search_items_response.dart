import 'package:collection/collection.dart';
//import 'package:flutter/foundation.dart';
//import 'package:freezed_annotation/freezed_annotation.dart';
//import 'package:json_annotation/json_annotation.dart';

//part 'paapi_search_items_response.freezed.dart';
//part 'paapi_search_items_response.g.dart';

// TODO(Riscait): freezed化する

/// JSON: Map<String, dynamic>を変換
/// SearchResultを内包する
class PaapiSearchItemResponse {
  const PaapiSearchItemResponse({
    this.searchResult,
  });

  factory PaapiSearchItemResponse.fromJson(Map<String, dynamic> json) {
    return PaapiSearchItemResponse(
      searchResult: PaapiSearchItemsResult.fromJson(
          json['SearchResult'] as Map<String, dynamic>),
    );
  }

  final PaapiSearchItemsResult? searchResult;
}

/// JSON: Map<String, dynamic>を変換
/// 複数アイテム情報等を含むデータのルート
class PaapiSearchItemsResult {
  const PaapiSearchItemsResult({
    this.items = const [],
    this.totalResultCount,
  });

  factory PaapiSearchItemsResult.fromJson(Map<String, dynamic> json) {
    final itemList =
        List<Map<String, dynamic>>.from(json['Items'] as List<dynamic>);
    final itemTypeList =
        itemList.map((dic) => PaapiSearchItem.fromJson(dic)).toList();
    return PaapiSearchItemsResult(
      items: itemTypeList,
      totalResultCount: json['TotalResultCount'] as int?,
    );
  }

  final List<PaapiSearchItem> items;
  final int? totalResultCount;
}

/// JSON: List<Map<String, dynamic>> リストの中身を変換
/// 単一のアイテム情報を内包
class PaapiSearchItem {
  const PaapiSearchItem({
    this.asin,
    this.detailPageUrl,
    this.images,
    this.itemInfo,
    this.offers,
  });

  factory PaapiSearchItem.fromJson(Map<String, dynamic> json) {
    return PaapiSearchItem(
      asin: json['ASIN'] as String?,
      detailPageUrl: json['DetailPageURL'] as String?,
      images: PaapiItemImage.fromJson(json['Images'] as Map<String, dynamic>),
      itemInfo:
          PaapiItemInfo.fromJson(json['ItemInfo'] as Map<String, dynamic>),
      offers: PaapiOffers.fromJson(json['Offers'] as Map<String, dynamic>),
    );
  }

  final String? asin;
  final String? detailPageUrl;
  final PaapiItemImage? images;
  final PaapiItemInfo? itemInfo;
  final PaapiOffers? offers;

  // ショートカット用Getter
  String? get displayAmount =>
      offers?.listings?.firstOrNull?.price?.displayAmount;
  String? get displayTitle => itemInfo?.title?.displayValue;
  String? get smallImageUrl => images?.primary?.small?.url;
  String? get mediumImageUrl => images?.primary?.medium?.url;
  String? get largeImageUrl => images?.primary?.large?.url;
  String? get categoryString =>
      itemInfo?.classifications?.itemBinding?.displayValue;
}

/// JSON: Map<String, dynamic>を変換
/// Primary, Variantsを持つ
class PaapiItemImage {
  const PaapiItemImage({
    this.primary,
  });

  factory PaapiItemImage.fromJson(Map<String, dynamic> json) {
    return PaapiItemImage(
      primary:
          PaapiItemImageSize.fromJson(json['Primary'] as Map<String, dynamic>),
    );
  }

  final PaapiItemImageSize? primary;
}

/// JSON: Map<String, dynamic>を変換
/// Small, Medium, Large を持つ
class PaapiItemImageSize {
  const PaapiItemImageSize({
    this.small,
    this.medium,
    this.large,
  });

  factory PaapiItemImageSize.fromJson(Map<String, dynamic> json) {
    return PaapiItemImageSize(
      small: PaapiItemImageSizeData.fromJson(
          json['Small'] as Map<String, dynamic>),
      medium: PaapiItemImageSizeData.fromJson(
          json['Medium'] as Map<String, dynamic>),
      large: PaapiItemImageSizeData.fromJson(
          json['Large'] as Map<String, dynamic>),
    );
  }

  final PaapiItemImageSizeData? small;
  final PaapiItemImageSizeData? medium;
  final PaapiItemImageSizeData? large;
}

/// JSON: Map<String, dynamic>を変換<br>
/// URL, Height, Width を持つ
class PaapiItemImageSizeData {
  const PaapiItemImageSizeData({
    this.url,
    this.height,
    this.width,
  });

  factory PaapiItemImageSizeData.fromJson(Map<String, dynamic> json) {
    return PaapiItemImageSizeData(
      url: json['URL'] as String?,
      height: json['Height'] as int?,
      width: json['Width'] as int?,
    );
  }

  final String? url;
  final int? height;
  final int? width;
}

/// JSON: Map<String, dynamic>を変換
/// Title を持つ
class PaapiItemInfo {
  const PaapiItemInfo({this.title, this.classifications});

  factory PaapiItemInfo.fromJson(Map<String, dynamic> json) {
    return PaapiItemInfo(
      title: PaapiItemTitle.fromJson(json['Title'] as Map<String, dynamic>),
      classifications: PaapiItemClassifications.fromJson(
          json['Classifications'] as Map<String, dynamic>),
    );
  }

  final PaapiItemTitle? title;
  final PaapiItemClassifications? classifications;
}

/// JSON: Map<String, dynamic>を変換<br>
/// DisplayValue, Label, Locale を持つ
class PaapiItemTitle {
  const PaapiItemTitle({
    this.displayValue,
  });

  factory PaapiItemTitle.fromJson(Map<String, dynamic> json) {
    return PaapiItemTitle(
      displayValue: json['DisplayValue'] as String?,
    );
  }

  final String? displayValue;
}

/// ProductGroup を持つ
class PaapiItemClassifications {
  const PaapiItemClassifications({
    this.itemBinding,
    this.productGroup,
  });

  factory PaapiItemClassifications.fromJson(Map<String, dynamic> json) {
    return PaapiItemClassifications(
      productGroup: json['Binding'] == null
          ? null
          : PaapiItemProductGroup.fromJson(
              json['Binding'] as Map<String, dynamic>,
            ),
      itemBinding: json['ProductGroup'] == null
          ? null
          : PaapiItemBinding.fromJson(
              json['ProductGroup'] as Map<String, dynamic>,
            ),
    );
  }

  final PaapiItemBinding? itemBinding;
  final PaapiItemProductGroup? productGroup;
}

/// DisplayValue, Label, Locale を持つ
class PaapiItemProductGroup {
  const PaapiItemProductGroup({
    this.displayValue,
  });

  factory PaapiItemProductGroup.fromJson(Map<String, dynamic> json) {
    return PaapiItemProductGroup(
      displayValue: json['DisplayValue'] as String?,
    );
  }

  final String? displayValue;
}

/// DisplayValue, Label, Locale を持つ
class PaapiItemBinding {
  const PaapiItemBinding({
    this.displayValue,
  });

  factory PaapiItemBinding.fromJson(Map<String, dynamic> json) {
    return PaapiItemBinding(
      displayValue: json['DisplayValue'] as String?,
    );
  }

  final String? displayValue;
}

class PaapiOffers {
  const PaapiOffers({this.listings});

  factory PaapiOffers.fromJson(Map<String, dynamic> json) {
    return PaapiOffers(
      listings: List<PaapiOffersListings>.from((json['Listings'] as List)
          .map<PaapiOffersListings>((dynamic x) =>
              PaapiOffersListings.fromJson(x as Map<String, dynamic>))),
    );
  }

  final List<PaapiOffersListings>? listings;
}

class PaapiOffersListings {
  const PaapiOffersListings({this.price});

  factory PaapiOffersListings.fromJson(Map<String, dynamic> json) {
    return PaapiOffersListings(
      price: PaapiOffersPrice.fromJson(json['Price'] as Map<String, dynamic>),
    );
  }

  final PaapiOffersPrice? price;
}

class PaapiOffersPrice {
  const PaapiOffersPrice({
    this.amount,
    this.displayAmount,
  });

  factory PaapiOffersPrice.fromJson(Map<String, dynamic> json) {
    return PaapiOffersPrice(
      amount: json['Amount'] as double?,
      displayAmount: json['DisplayAmount'] as String?,
    );
  }

  final double? amount;
  final String? displayAmount;
}
