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

/// Various prop related mixins to be used with [UiComponent] descendants.
library over_react.prop_mixins;

import 'dart:html';
import 'dart:js' show JsObject;

// Must import these consts because they are used in the transformed code.
// ignore: unused_import
import 'package:over_react/over_react.dart' show PropDescriptor, ConsumedProps;
import 'package:over_react/src/component/aria_mixin.dart';
import 'package:over_react/src/component/callback_typedefs.dart';
import 'package:over_react/src/component_declaration/annotations.dart';

/// Typed getters/setters for reserved React JS props.
///
/// To be used as a mixin for React components and builders.
///
/// Related: [DomPropsMixin], [SvgPropsMixin], [AriaPropsMixin]
@PropsMixin(keyNamespace: '')
abstract class ReactPropsMixin {
  Map get props;

  /// The children that were passed in to this component when it was built.
  List children;

  /// A String that differentiates a component from its siblings.
  ///
  /// When setting [key] you can use any [Object], its `toString()` method will be called when applying the value.
  ///
  /// Keys are necessary when children are dynamic, such as those passed in as a [List],
  /// but are generally not required when using variadic children.
  ///
  /// For more info, see:
  ///
  /// * <https://facebook.github.io/react/docs/composition-vs-inheritance.html>
  /// * <https://facebook.github.io/react/docs/reconciliation.html>
  String get key        => props['key'];
  set key(Object value) => props['key'] = value == null ? null : value.toString();

  /// Either a String used to retrieve the element at a later time via [react.Component.ref],
  /// or a Function that gets called with the element when it is mounted.
  ///
  /// See: <https://facebook.github.io/react/docs/refs-and-the-dom.html>.
  dynamic ref;
}

/// Typed getters/setters for reserved DOM-related props.
///
/// To be used as a mixin for React components and builders.
///
/// Related: [ReactPropsMixin], [SvgPropsMixin], [AriaPropsMixin]
@PropsMixin(keyNamespace: '')
abstract class DomPropsMixin {
  Map get props;

  int cols, rows, size, span, start;

  bool allowFullScreen, async, autoPlay, checked, controls, defer, disabled, formNoValidate, hidden, loop, multiple,
    muted, noValidate, readOnly, required, seamless, selected;

  Map<String, dynamic> style;

  String className, title, id;

  dynamic accept, acceptCharset, accessKey, action, allowTransparency, alt, autoComplete, cellPadding, cellSpacing,
    charSet, classID, colSpan, content, contentEditable, contextMenu, coords, crossOrigin, data, dateTime,
    dir, download, draggable, encType, form, frameBorder, height, href, hrefLang, htmlFor, httpEquiv, icon, label,
    lang, list, manifest, max, maxLength, media, mediaGroup, method, min, name, open, pattern, placeholder,
    poster, preload, radioGroup, rel, role, rowSpan, sandbox, scope, scrolling, shape, sizes, spellCheck, src, srcDoc,
    srcSet, step, tabIndex, target, type, useMap, value, width, wmode;

  ClipboardEventCallback onCopy, onCut, onPaste;
  KeyboardEventCallback onKeyDown, onKeyPress, onKeyUp;
  FocusEventCallback onFocus, onBlur;
  FormEventCallback onChange, onInput, onSubmit, onReset;
  MouseEventCallback
    onClick, onContextMenu, onDoubleClick, onDrag, onDragEnd, onDragEnter, onDragExit, onDragLeave, onDragOver,
    onDragStart, onDrop, onMouseDown, onMouseEnter, onMouseLeave, onMouseMove, onMouseOut, onMouseOver, onMouseUp;
  TouchEventCallback onTouchCancel, onTouchEnd, onTouchMove, onTouchStart;
  UIEventCallback onScroll;
  WheelEventCallback onWheel;

  // props specific to React.INPUT
  bool defaultChecked;
  dynamic defaultValue;

  /// Polyfills/normalizes the `autofocus` attribute via AutoFocusMixin
  /// (mixed in by React DOM <input>, <textarea>, and <select>).
  bool autoFocus;
}

/// Typed getters/setters for reserved SVG-related props.
///
/// To be used as a mixin for React components and builders.
///
/// Related: [ReactPropsMixin], [DomPropsMixin], [AriaPropsMixin]
@PropsMixin(keyNamespace: '')
abstract class SvgPropsMixin {
  Map get props;

  dynamic clipPath, cx, cy, d, dx, dy, fill, fillOpacity, fontFamily, fontSize, fx, fy, gradientTransform,
    gradientUnits, markerEnd, markerMid, markerStart, offset, opacity, patternContentUnits, patternUnits, points,
    preserveAspectRatio, r, rx, ry, spreadMethod, stopColor, stopOpacity, stroke, strokeDasharray, strokeLinecap,
    strokeOpacity, strokeWidth, textAnchor, transform, version, viewBox, x1, x2, x, xlinkActuate, xlinkArcrole,
    xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType, xmlBase, xmlLang, xmlSpace, y1, y2, y;
}

/// Typed getters/setters for [DomPropsMixin] members that are HTML [Element] Global Attributes -
/// and should be __exposed for all OverReact Components__.
///
/// To be used as a mixin for React components and builders.
///
/// Related: [DomPropsMixin]
///
/// See: <https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes>
@PropsMixin(keyNamespace: '')
abstract class UbiquitousDomPropsMixin {
  Map get props;

  /// The HTML `tabindex` [global attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes).
  ///
  /// __Must be a valid integer or String of valid integer.__
  ///
  /// * __When `null`:__ The [Element] is not focusable unless it is a
  ///   specific type of element that is inherently focusable.
  /// * __When `-1`:__ The [Element] cannot be navigated to using the `TAB` key,
  ///   but can become focused when a click event occurs within it.
  /// * __When any other integer or String of a valid integer:__ The [Element]
  ///   can be navigated to using the `TAB` key and can also become focused
  ///   when a click event occurs within it.
  ///
  /// See: <https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex>
  dynamic tabIndex;

  /// The HTML `id` [global attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes).
  ///
  /// * Must be unique in the whole [document].
  /// * Cannot contain whitespace.
  /// * Should start with a letter.
  ///
  /// See: <https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/id>
  String id;

  /// The HTML `title` [global attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes).
  ///
  /// Represents advisory information about the [Element] it belongs to.
  ///
  /// See: <https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title>
  String title;

  /// The HTML `style` [global attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes).
  ///
  /// Contains CSS styling declarations to be applied to the [Element] it belongs to.
  ///
  /// __Note that since this proxies the React JS style implementation _(which is a [JsObject])_,
  /// camelCased properties must be used instead of CSS strings.__
  ///
  ///     (UiComponent()..style = {
  ///       'width': '${state.progress * 100}%',
  ///       'display': state.isHidden ? 'none' : '',
  ///       // Note the use of `marginLeft` instead of `margin-left`.
  ///       'marginLeft': '3rem'
  ///     })()
  ///
  /// See: <https://facebook.github.io/react/docs/dom-elements.html#style>
  Map<String, dynamic> style;

  /// Callback for when the user copies the content of an [Element].
  ///
  /// Related: [onCut], [onPaste]
  ClipboardEventCallback onCopy;

  /// Callback for when the user cuts the content of an [Element].
  ///
  /// Related: [onCopy], [onPaste]
  ClipboardEventCallback onCut;

  /// Callback for when the user pastes some content in an [Element].
  ///
  /// Related: [onCopy], [onCut]
  ClipboardEventCallback onPaste;

  /// Callback for when the user is pressing a key.
  ///
  /// Related: [onKeyPress], [onKeyUp]
  KeyboardEventCallback onKeyDown;

  /// Callback for when the user presses a key.
  ///
  /// Related: [onKeyDown], [onKeyUp]
  KeyboardEventCallback onKeyPress;

  /// Callback for when the user releases a key.
  ///
  /// Related: [onKeyDown], [onKeyPress]
  KeyboardEventCallback onKeyUp;

  /// Callback for when an [Element] becomes "focused".
  ///
  /// The [Element] is represented by [document.activeElement].
  ///
  /// Related: [onBlur]
  FocusEventCallback onFocus;

  /// Callback for when an [Element] loses focus.
  ///
  /// Related: [onFocus]
  FocusEventCallback onBlur;

  /// Callback for when the content, the selection, or the checked state
  /// of an [InputElement] have changed.
  ///
  /// Related: [onInput]
  FormEventCallback onChange;

  /// Callback for when an [InputElement] receives user input.
  ///
  /// Related: [onChange]
  FormEventCallback onInput;

  /// Callback for when the data of a [FormElement] is submitted.
  ///
  /// Related: [onReset]
  FormEventCallback onSubmit;

  /// Callback for when the data of a [FormElement] is reset.
  ///
  /// Related: [onSubmit]
  FormEventCallback onReset;

  /// Callback for when the user clicks on an [Element].
  ///
  /// Related: [onContextMenu], [onDoubleClick]
  MouseEventCallback onClick;

  /// Callback for when the user right-clicks on an [Element] to open a context menu.
  ///
  /// Related: [onClick], [onDoubleClick]
  MouseEventCallback onContextMenu;

  /// Callback for when the user double-clicks on an [Element].
  ///
  /// Related: [onClick], [onContextMenu]
  MouseEventCallback onDoubleClick;

  /// Callback for when an [Element] is being dragged.
  ///
  /// Related: [onDrop], [onDragEnd], [onDragEnter], [onDragExit], [onDragLeave], [onDragOver], [onDragStart]
  MouseEventCallback onDrag;

  /// Callback for when the user has finished dragging an [Element].
  ///
  /// Related: [onDrop], [onDrag], [onDragEnter], [onDragExit], [onDragLeave], [onDragOver], [onDragStart]
  MouseEventCallback onDragEnd;

  /// Callback for when the dragged [Element] enters the drop target.
  ///
  /// Related: [onDrop], [onDrag], [onDragEnd], [onDragExit], [onDragLeave], [onDragOver], [onDragStart]
  MouseEventCallback onDragEnter;

  /// Callback for when the dragged [Element] exits the drop target.
  ///
  /// Related: [onDrop], [onDrag], [onDragEnter], [onDragLeave], [onDragOver], [onDragStart]
  MouseEventCallback onDragExit;

  /// Callback for when the dragged [Element] leaves the drop target.
  ///
  /// Related: [onDrop], [onDrag], [onDragEnter], [onDragExit], [onDragOver], [onDragStart]
  MouseEventCallback onDragLeave;

  /// Callback for when the dragged [Element] is over the drop target.
  ///
  /// Related: [onDrop], [onDrag], [onDragEnter], [onDragExit], [onDragLeave], [onDragStart]
  MouseEventCallback onDragOver;

  /// Callback for when the user starts to drag an [Element].
  ///
  /// Related: [onDrop], [onDrag], [onDragEnter], [onDragExit], [onDragLeave], [onDragOver]
  MouseEventCallback onDragStart;

  /// Callback for when the dragged [Element] is dropped on the drop target.
  ///
  /// Related: [onDrag], [onDragEnter], [onDragExit], [onDragLeave], [onDragOver], [onDragStart]
  MouseEventCallback onDrop;

  /// Callback for when the user presses a mouse button over an [Element].
  ///
  /// Related: [onMouseUp]
  MouseEventCallback onMouseDown;

  /// Callback for when the pointer is moved onto an [Element].
  ///
  /// Related: [onMouseLeave], [onMouseOver]
  MouseEventCallback onMouseEnter;

  /// Callback for when the pointer is moved out of an [Element].
  ///
  /// Related: [onMouseEnter], [onMouseOut]
  MouseEventCallback onMouseLeave;

  /// Callback for when the pointer is moving while it is over an [Element].
  MouseEventCallback onMouseMove;

  /// Callback for when a user moves the mouse pointer out of an [Element], or out of one of its children.
  ///
  /// Related: [onMouseOver], [onMouseLeave]
  MouseEventCallback onMouseOut;

  /// Callback for when the pointer is moved onto an [Element], or onto one of its children.
  ///
  /// Related: [onMouseOut], [onMouseEnter]
  MouseEventCallback onMouseOver;

  /// Callback for when a user releases a mouse button over an [Element].
  ///
  /// Related: [onMouseUp]
  MouseEventCallback onMouseUp;

  /// Callback for when the touch is interrupted.
  ///
  /// Related: [onTouchEnd], [onTouchMove], [onTouchStart]
  TouchEventCallback onTouchCancel;

  /// Callback for when a finger is removed from a touch screen.
  ///
  /// Related: [onTouchCancel], [onTouchMove], [onTouchStart]
  TouchEventCallback onTouchEnd;

  /// Callback for when a finger is dragged across the screen.
  ///
  /// Related: [onTouchEnd], [onTouchCancel], [onTouchStart]
  TouchEventCallback onTouchMove;

  /// Callback for when a finger is placed on a touch screen.
  ///
  /// Related: [onTouchEnd], [onTouchMove], [onTouchCancel]
  TouchEventCallback onTouchStart;

  /// Callback for when an [Element]'s scrollbar is being scrolled.
  UIEventCallback onScroll;

  /// Callback for when the mouse wheel rolls up or down over an [Element].
  WheelEventCallback onWheel;
}
