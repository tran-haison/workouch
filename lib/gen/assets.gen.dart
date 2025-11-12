// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/add.svg');

  /// File path: assets/icons/arrow_back.svg
  SvgGenImage get arrowBack => const SvgGenImage('assets/icons/arrow_back.svg');

  /// File path: assets/icons/arrow_down.svg
  SvgGenImage get arrowDown => const SvgGenImage('assets/icons/arrow_down.svg');

  /// File path: assets/icons/arrow_right_wide.svg
  SvgGenImage get arrowRightWide =>
      const SvgGenImage('assets/icons/arrow_right_wide.svg');

  /// File path: assets/icons/arrow_top_right.svg
  SvgGenImage get arrowTopRight =>
      const SvgGenImage('assets/icons/arrow_top_right.svg');

  /// File path: assets/icons/arrow_up.svg
  SvgGenImage get arrowUp => const SvgGenImage('assets/icons/arrow_up.svg');

  /// File path: assets/icons/check.svg
  SvgGenImage get check => const SvgGenImage('assets/icons/check.svg');

  /// File path: assets/icons/clock.svg
  SvgGenImage get clock => const SvgGenImage('assets/icons/clock.svg');

  /// File path: assets/icons/close.svg
  SvgGenImage get close => const SvgGenImage('assets/icons/close.svg');

  /// File path: assets/icons/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/icons/delete.svg');

  /// File path: assets/icons/distance.svg
  SvgGenImage get distance => const SvgGenImage('assets/icons/distance.svg');

  /// File path: assets/icons/dumbbell.svg
  SvgGenImage get dumbbell => const SvgGenImage('assets/icons/dumbbell.svg');

  /// File path: assets/icons/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/icons/edit.svg');

  /// File path: assets/icons/error.svg
  SvgGenImage get error => const SvgGenImage('assets/icons/error.svg');

  /// File path: assets/icons/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/icons/filter.svg');

  /// File path: assets/icons/fire.svg
  SvgGenImage get fire => const SvgGenImage('assets/icons/fire.svg');

  /// File path: assets/icons/line_weight.svg
  SvgGenImage get lineWeight =>
      const SvgGenImage('assets/icons/line_weight.svg');

  /// File path: assets/icons/namespace.svg
  SvgGenImage get namespace => const SvgGenImage('assets/icons/namespace.svg');

  /// File path: assets/icons/puregym.svg
  SvgGenImage get puregym => const SvgGenImage('assets/icons/puregym.svg');

  /// File path: assets/icons/reorder.svg
  SvgGenImage get reorder => const SvgGenImage('assets/icons/reorder.svg');

  /// File path: assets/icons/rest.svg
  SvgGenImage get rest => const SvgGenImage('assets/icons/rest.svg');

  /// File path: assets/icons/rocket.svg
  SvgGenImage get rocket => const SvgGenImage('assets/icons/rocket.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/user_lay.svg
  SvgGenImage get userLay => const SvgGenImage('assets/icons/user_lay.svg');

  /// File path: assets/icons/user_walk.svg
  SvgGenImage get userWalk => const SvgGenImage('assets/icons/user_walk.svg');

  /// File path: assets/icons/weight.svg
  SvgGenImage get weight => const SvgGenImage('assets/icons/weight.svg');

  /// File path: assets/icons/work.svg
  SvgGenImage get work => const SvgGenImage('assets/icons/work.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    add,
    arrowBack,
    arrowDown,
    arrowRightWide,
    arrowTopRight,
    arrowUp,
    check,
    clock,
    close,
    delete,
    distance,
    dumbbell,
    edit,
    error,
    filter,
    fire,
    lineWeight,
    namespace,
    puregym,
    reorder,
    rest,
    rocket,
    search,
    userLay,
    userWalk,
    weight,
    work,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
