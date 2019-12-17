import 'dart:collection';

import 'package:react_material_ui/theming.dart';
import 'package:json_annotation/json_annotation.dart';

// TODO: Finish filling this out
//@JsonSerializable(explicitToJson: true)
//class _WorkivaColorHues extends MapView with AbstractMuiThemeConfig {
//  _WorkivaColorHues([Map colorsMap]) : super(colorsMap ?? {});
//
//  factory _WorkivaColorHues.fromJson(Map<String, dynamic> json) => _$_WorkivaColorHuesFromJson(json);
//  @override Map<String, dynamic> toJson() => _$_WorkivaColorHuesToJson(this);
//
//  MuiPaletteColorHue get gray => MuiPaletteColorHue({
//    '50': '#f5f5f5', // TODO: Workiva would have to decide on a "50" color - this doesn't exist yet.
//    '100': '#ededed',
//    '200': '#e3e3e3',
//    '300': '#d6d6d6',
//    '400': '#c7c7c7',
//    '500': '#b3b3b3',
//    '600': '#616161',
//    '700': '#474747',
//    '800': '#333333',
//    '900': '#242424',
//  });
//
//  MuiPaletteColorHue get green => MuiPaletteColorHue({
//    '50': '#E8F5E9', // TODO: Workiva would have to decide on a "50" color - this doesn't exist yet.
//    '100': '#C8E6C9', // TODO: Workiva would have to decide on a "100" color - this doesn't exist yet.
//    '200': '#A5D6A7', // TODO: Workiva would have to decide on a "200" color - this doesn't exist yet.
//    '300': '#c2eb99',
//    '400': '', // TODO: Workiva would have to decide on a "400" color - this doesn't exist yet.
//    '500': '#a3e066',
//    '600': '#85d633',
//    '700': '', // TODO: Workiva would have to decide on a "700" color - this doesn't exist yet.
//    '800': '#66cc00',
//    '900': '#339900',
//  });
//}

MuiTheme getTodoAppTheme([MuiTheme theme]) {
  theme ??= MuiTheme();
  return theme;
  // TODO: Play around with creating a "ZestyCrayon" theme.
//    ..palette.secondary = theme.palette.type == 'dark'
//        ? (MuiPaletteIntentionColor()
//            ..main = muiColors.yellow['500']
//            ..light = muiColors.yellow['50']
//            ..dark = muiColors.yellow['800']
//          )
//        : theme.palette.secondary;
}
