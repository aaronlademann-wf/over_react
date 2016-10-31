// Copyright 2016 Workiva Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Utilities for manipulating and generating CSS class names.
///
/// Inspired by <https://github.com/JedWatson/classnames>.
library over_react.class_names;

import 'dart:collection';

// Must import `PropDescriptor` and `ConsumedProps` because they are used in the transformed code.
import 'package:over_react/over_react.dart';
import 'package:over_react/src/component_declaration/annotations.dart';

/// Typed getters/setters for props related to CSS class manipulation, and used by all over_react components.
///
/// To be used as a mixin for React components and builders.
@PropsMixin(keyNamespace: '')
abstract class CssClassPropsMixin {
  Map get props;

  /// String of space-delimited CSS classes to be added to the resultant DOM.
  ///
  /// All over_react components merge any added classes with this prop and the [classNameBlacklist] prop.
  ///
  /// See: [UiComponent.forwardingClassNameBuilder].
  String className;

  /// String of space-delimited CSS classes to be blacklisted from being added to the resultant DOM.
  ///
  /// All over_react components merge any added classes with this prop and the [className] prop (see
  /// [UiComponent.forwardingClassNameBuilder]).
  String classNameBlacklist;
}

/// A [MapView] with the typed getters/setters for all props within [CssClassPropsMixin].
class CssClassPropsMapView extends MapView with CssClassPropsMixin {
  /// Create a new instance backed by the specified map.
  CssClassPropsMapView(Map map) : super(map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;
}

/// [StringBuffer]-backed `className` builder optimized for adding CSS classes,
/// with support for blacklisting CSS classes.
class ClassNameBuilder {
  StringBuffer _classNamesBuffer = new StringBuffer();
  StringBuffer _blacklistBuffer;

  /// Creates a new, empty `ClassNameBuilder`.
  ClassNameBuilder();

  /// Creates a new `ClassNameBuilder` with [CssClassPropsMixin.className] and [CssClassPropsMixin.classNameBlacklist]
  /// values from the given [props] Map.
  ///
  /// This method gracefully handles null [props], as well as unspecified/null prop values.
  ClassNameBuilder.fromProps(Map props) {
    addFromProps(props);
  }

  /// Adds the [CssClassPropsMixin.className] and [CssClassPropsMixin.classNameBlacklist]
  /// values from the given [props] Map.
  ///
  /// This method gracefully handles null [props], as well as unspecified/null prop values.
  ///
  /// This method, along with [toProps], is useful for merging sets of className/blacklist props.
  void addFromProps(Map props) {
    if (props == null) {
      return;
    }

    var cssClassProps = new CssClassPropsMapView(props);

    this
      ..add(cssClassProps.className)
      ..blacklist(cssClassProps.classNameBlacklist);
  }

  /// Adds the given [className] string.
  ///
  /// May be a single CSS class 'token', or multiple space-delimited classes IF [should] is true.
  /// Otherwise, does nothing _(convenience for helping to inline addition conditionals)_.
  ///
  /// __There is no checking for duplicate CSS classes.__
  void add(String className, [bool should = true]) {
    if (!should || className == null || className == '') {
      return;
    }

    if (_classNamesBuffer.isNotEmpty) {
      _classNamesBuffer.write(' ');
    }
    _classNamesBuffer.write(className);
  }

  /// Adds all of the CSS classes represented by [className] _(a space-delimited list)_ to the blacklist
  /// IF [should] is true, otherwise, does nothing _(convenience for helping to inline blacklisting conditionals)_.
  ///
  /// Classes added to the blacklist will not appear in the result of [toClassName].
  void blacklist(String className, [bool should = true]) {
    if (!should || className == null || className == '') {
      return;
    }

    if (_blacklistBuffer == null) {
      _blacklistBuffer = new StringBuffer();
    } else {
      if (_blacklistBuffer.isNotEmpty) {
        _blacklistBuffer.write(' ');
      }
    }
    _blacklistBuffer.write(className);
  }

  /// Returns a String representation of the built className, which includes any added classes, and none of the
  /// blacklisted classes.
  ///
  /// __Duplicate classes will be added.__
  String toClassName() {
    String className = _classNamesBuffer.toString();

    if (_blacklistBuffer != null && _blacklistBuffer.isNotEmpty) {
      List blacklistedClasses = splitSpaceDelimitedString(_blacklistBuffer.toString());

      className = splitSpaceDelimitedString(className)
        .where((String cssClass) => !blacklistedClasses.contains(cssClass))
        .join(' ');
    }

    return className;
  }

  /// Returns a String representation of only the blacklisted classes.
  ///
  /// Useful for blacklist forwarding.
  ///
  /// __Duplicate classes will be added.__
  String toClassNameBlacklist() {
    return _blacklistBuffer == null || _blacklistBuffer.isEmpty
      ? null
      : _blacklistBuffer.toString();
  }

  /// Returns a Map with the [CssClassPropsMixin.className] and [CssClassPropsMixin.classNameBlacklist] props
  /// populated from the return values of [toClassName] and [toClassNameBlacklist], respectively.
  ///
  /// This method, along with [addFromProps], is useful for merging sets of className/blacklist props.
  Map toProps() {
    return new CssClassPropsMapView({})
      ..className = toClassName()
      ..classNameBlacklist = toClassNameBlacklist();
  }

  @override
  String toString() {
    return '$runtimeType _classNamesBuffer: $_classNamesBuffer, _blacklistBuffer: $_blacklistBuffer, toClassName(): ${toClassName()}';
  }
}

/// Returns a List of space-delimited tokens efficiently split from the specified string.
///
/// Useful for splitting CSS class name strings into class tokens, or `data-test-id` values into individual test IDs.
///
/// Handles leading and trailing spaces, as well as tokens separated by multiple spaces.
///
/// Example:
///
///     splitSpaceDelimitedString('   foo bar     baz') // ['foo', 'bar', 'baz']
List<String> splitSpaceDelimitedString(String string) {
  const int SPACE = 32; // ' '.codeUnits.first;

  List<String> strings = [];
  int start = 0;

  while (start != string.length) {
    while (string.codeUnitAt(start) == SPACE) {
      start++;
      if (start == string.length) {
        return strings;
      }
    }

    int end = start;
    while (string.codeUnitAt(end) != SPACE) {
      end++;
      if (end == string.length) {
        strings.add(string.substring(start, end));
        return strings;
      }
    }

    strings.add(string.substring(start, end));

    start = end;
  }

  return strings;
}
