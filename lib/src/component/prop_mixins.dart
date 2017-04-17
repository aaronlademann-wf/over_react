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

// Must import these consts because they are used in the transformed code.
// ignore: unused_import
import 'package:over_react/over_react.dart' show PropDescriptor, ConsumedProps;
import 'package:over_react/src/component/callback_typedefs.dart';
import 'package:over_react/src/component_declaration/annotations.dart';
import 'package:over_react/src/component_declaration/component_base.dart';
import 'package:over_react/src/component/dom_components.dart';
import 'package:over_react/src/component/aria_mixin.dart';

/// Typed getters/setters for reserved React props.
///
/// To be used as a mixin for React components and builders.
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
  /// * <https://facebook.github.io/react/docs/multiple-components.html#children>
  /// * <https://facebook.github.io/react/docs/reconciliation.html>
  String get key        => props['key'];
  set key(Object value) => props['key'] = value == null ? null : value.toString();

  /// Either a String used to retrieve the element at a later time via [react.Component.ref],
  /// or a Function that gets called with the element when it is mounted.
  ///
  /// See: <https://facebook.github.io/react/docs/more-about-refs.html>.
  dynamic ref;
}

/// Typed getters/setters for reserved [Dom] component-related props.
///
/// To be used as a mixin for React components and builders.
@PropsMixin(keyNamespace: '')
abstract class DomPropsMixin {
  Map get props;

  /// List of types the server accepts, typically a file type.
  dynamic accept;

  /// List of supported charsets.
  dynamic acceptCharset;

  /// Defines a keyboard shortcut that is used to "activate" or add focus to the element.
  dynamic accessKey;

  /// The URI of a program that processes the information submitted via the [Dom.form].
  dynamic action;

  /// This attribute can be set to `true` on a [Dom.iframe] if the frame is allowed to be placed into
  /// full screen mode by calling the `Element.requestFullscreen` method.
  ///
  /// If this isn't set, the element can't be placed into full screen mode.
  bool allowFullScreen;

  /// This was an Internet Explorer attribute for [Dom.iframe] elements,
  /// but it has never been part of a recognised standard.
  ///
  /// __DO NOT USE.__ This attribute is obselete in HTML5.
  @Deprecated('2.0.0')
  dynamic allowTransparency;

  /// Alternative text that should be displayed / read to a user in case [Dom.img] can't be displayed.
  dynamic alt;

  /// An attribute that can be placed on a `<script>` tag to indicate that it should be executed asynchronously.
  ///
  /// Related: [defer]
  bool async;

  /// Indicates whether controls in a [Dom.form] can have their values automatically completed by the browser.
  ///
  /// TODO: Change to `bool` in the `2.0.0` release
  /*bool*/ dynamic autoComplete;

  /// Indicates whether the [Dom.input] / [Dom.textarea] / [Dom.select] should be focused __when first mounted__.
  bool autoFocus;

  /// An attribute that can be placed on a [Dom.audio] or [Dom.video] to indicate that it should play
  /// as soon as possible.
  bool autoPlay;

  /// Set on a [Dom.table] to determine the space between child cell walls and cell content.
  ///
  /// __DO NOT USE.__ This attribute is obselete in HTML5.
  @Deprecated('2.0.0')
  dynamic cellPadding;

  /// Set on a [Dom.table] to determine the space, in pixels, between child cells.
  ///
  /// __DO NOT USE.__ This attribute is obselete in HTML5.
  @Deprecated('2.0.0')
  dynamic cellSpacing;

  /// Declares the character encoding of the page _(using [Dom.meta])_ or [Dom.script].
  dynamic charSet;

  /// Indicates whether the [Dom.input] _(of type `checkbox` or `radio`)_ should be checked when rendered.
  ///
  /// > When set to a non-null value, a "controlled" React component will be rendered, meaning that you must
  /// > use [onChange] to keep the input updated based on user interactions.
  /// >
  /// > See: <https://facebook.github.io/react/docs/forms.html#controlled-components>
  ///
  /// Related: [defaultChecked]
  bool checked;

  /// Provides a reference that the browser can use to understand how a [Dom.object] should be implemented.
  dynamic classID;

  /// String of space-delimited CSS classes to be added to the resultant DOM.
  String className;

  /// Defines the number of columns in a [Dom.textarea].
  int cols;

  /// Defines the number of columns a [Dom.td] or [Dom.th] should span within a [Dom.tr].
  ///
  /// Related: [rowSpan]
  ///
  /// TODO: Change to an `int` in the `2.0.0` release
  /*int*/ dynamic colSpan;

  /// A value associated with [httpEquiv] or [name] depending on the context of the [Dom.meta] to which it is applied.
  dynamic content;

  /// Indicates whether the element's content is editable.
  dynamic contentEditable;

  /// Defines the [id] of a [Dom.menu] element _(or element that has [role] set to [Role.menu])_
  /// which will serve as the element's context menu.
  dynamic contextMenu;

  /// Indicates whether the browser should show playback controls to the user on a [Dom.audio] or [Dom.video].
  bool controls;

  /// A set of values specifying the coordinates of a [shape] for a [Dom.area].
  ///
  /// __Example:__
  ///
  ///     @override
  ///     render() {
  ///       return Dom.div()(
  ///         (Dom.img()
  ///           ..src = '/some/path/to-an-image.png'
  ///           ..useMap = 'shapes-map'
  ///         )(),
  ///         (Dom.map()..name = 'shapes-map')(
  ///           (Dom.area()
  ///             ..shape = 'rect'
  ///             ..title = 'square'
  ///             ..coords = '19,28,222,228'
  ///             ..href = '/go/here/when-they-click-on-the-rectangle'
  ///           )(),
  ///           (Dom.area()
  ///             ..shape = 'circle'
  ///             ..title = 'circle'
  ///             ..coords = '361,132,96'
  ///             ..href = '/go/here/when-they-click-on-the-circle'
  ///           )()
  ///         )
  ///       );
  ///     }
  ///
  /// See: <http://html.com/attributes/area-shape/>
  dynamic coords;

  /// How the element handles cross-origin requests.
  ///
  /// Can be used on:
  ///
  /// * [Dom.audio]
  /// * [Dom.img]
  /// * [Dom.link]
  /// * [Dom.script]
  /// * [Dom.video]
  dynamic crossOrigin;

  /// Specifies the URL of the [Dom.object] resource.
  dynamic data;

  /// Indicates the date and time associated with the element.
  ///
  /// Can be used on:
  ///
  /// * [Dom.time]
  /// * [Dom.del]
  /// * [Dom.ins]
  dynamic dateTime;

  /// Indicates whether the [Dom.input] _(of type `checkbox` or `radio`)_ should be checked __when first mounted__.
  ///
  /// > When set to a non-null value, an "uncontrolled" React component will be mounted, meaning further updates
  /// > to this prop value will have no effect on the input.
  /// >
  /// > Use [checked] instead if you want to change the checked "state" of an input programatically.
  /// >
  /// > See: <https://facebook.github.io/react/docs/uncontrolled-components.html>
  ///
  /// Related: [defaultValue]
  bool defaultChecked;

  /// The value of the [Dom.input] / [Dom.textarea] / [Dom.select] __when first mounted__.
  ///
  /// > When set to a non-null value, an "uncontrolled" React component will be mounted, meaning further updates
  /// > to this prop value will have no effect on the form control.
  /// >
  /// > Use [value] instead if you want to change the value of an form control programatically.
  /// >
  /// > See: <https://facebook.github.io/react/docs/uncontrolled-components.html>
  ///
  /// Related: [defaultValue]
  dynamic defaultValue;

  /// An attribute that can be placed on a `<script>` tag to indicate that it should be executed
  /// after the page has been parsed.
  ///
  /// Related: [async]
  bool defer;

  /// Defines the text direction.
  ///
  /// Allowed values are:
  ///
  /// * `ltr` (Left-To-Right)
  /// * `rtl` (Right-To-Left)
  dynamic dir;

  /// Indicates whether the user can interact with the element.
  ///
  /// Can be used on:
  ///
  /// * [Dom.button]
  /// * [Dom.fieldset]
  /// * [Dom.input]
  /// * [Dom.keygen]
  /// * [Dom.optgroup]
  /// * [Dom.option]
  /// * [Dom.select]
  /// * [Dom.textarea]
  ///
  /// Related: [readOnly]
  bool disabled;

  /// Indicates that [Dom.a] is to be used for downloading a resource to a local file system
  /// rather than opening a page in the browser.
  dynamic download;

  /// Defines whether the element can be dragged.
  dynamic draggable;

  /// Defines the content type of the [Dom.form] date when [method] is set to `POST`.
  dynamic encType;

  /// The [id] of a [Dom.form] that is the owner of the element.
  ///
  /// Used when a form control is not a descendant of the form.
  dynamic form;

  /// Use [noValidate].
  bool formNoValidate;

  /// Specifies whether or not to display a border around a [Dom.iframe].
  ///
  /// __DO NOT USE.__ This attribute is obselete in HTML5.
  @Deprecated('2.0.0')
  dynamic frameBorder;

  /// Specifies the height _(in pixels)_ of the following elements:
  ///
  /// * [Dom.canvas]
  /// * [Dom.embed]
  /// * [Dom.iframe]
  /// * [Dom.img]
  /// * [Dom.input]
  /// * [Dom.object]
  /// * [Dom.video]
  ///
  /// __For all other elements, use the CSS height property instead.__
  ///
  /// TODO: Change to an `int` in the `2.0.0` release
  /*int*/ dynamic height;

  /// The URL of a linked resource.
  ///
  /// Can be used on:
  ///
  /// * [Dom.a]
  /// * [Dom.area]
  /// * [Dom.base]
  /// * [Dom.link]
  dynamic href;

  /// Specifies the language of a given [href].
  ///
  /// Can be used on:
  ///
  /// * [Dom.a]
  /// * [Dom.area]
  /// * [Dom.base]
  /// * [Dom.link]
  dynamic hrefLang;

  /// Set this on a [Dom.label] to the [id] of the form control that it labels / describes.
  ///
  /// __Example:__
  ///
  ///     @override
  ///     render() {
  ///       return Dom.form()(
  ///         (Dom.label()..htmlFor = 'input-id')('Describe the input'),
  ///         (Dom.input()
  ///           ..id = 'input-id'
  ///           ..type = 'text'
  ///         )()
  ///       )
  ///     }
  dynamic htmlFor;

  /// Set this on a [Dom.meta] to provide an HTTP header for the value of [content].
  dynamic httpEquiv;

  /// Prevents rendering of the element it is applied to while keeping child elements, e.g. `<script>` elements, active.
  bool hidden;

  /// Specifies a picture which represents the `<command>`.
  dynamic icon;

  /// Unique identifier for an element.
  ///
  /// Must be unique amongst all the ids, and contain at least one character.
  String id;

  /// Specifies a user-readable title of the text [Dom.track].
  dynamic label;

  /// Defines the language used in the element.
  dynamic lang;

  /// Refers to the [id] of a [Dom.datalist] that contains a list of pre-defined [Dom.option]s
  /// that will be suggested to the user for the [Dom.input] value.
  ///
  /// __Example:__
  ///
  ///     @override
  ///     render() {
  ///       return Dom.form()(
  ///         (Dom.label()..htmlFor = 'browser-input')('Browser'),
  ///         (Dom.input()
  ///           ..id = 'browser-input'
  ///           ..list = 'browsers'
  ///           ..type = 'text'
  ///         )(),
  ///         (Dom.datalist()..id = 'browsers')(
  ///           (Dom.option..value = 'Internet Explorer')(),
  ///           (Dom.option..value = 'Firefox')(),
  ///           (Dom.option..value = 'Chrome')(),
  ///           (Dom.option..value = 'Opera')(),
  ///           (Dom.option..value = 'Safari')(),
  ///         ),
  ///       )
  ///     }
  dynamic list;

  /// Indicates whether a [Dom.video] or [Dom.audio] should start playing from the start when it's finished.
  bool loop;

  /// Specifies the URL of the [Dom.html]'s cache manifest.
  dynamic manifest;

  /// Indicates the maximum [value] allowed for a [Dom.input], [Dom.meter] or [Dom.progress].
  ///
  /// Related: [min]
  dynamic max;

  /// Defines the maximum number of characters allowed in [Dom.input] or [Dom.textarea].
  dynamic maxLength;

  /// Specifies a hint of the media for which the linked resource was designed.
  ///
  /// Can be used on:
  ///
  /// * [Dom.a]
  /// * [Dom.area]
  /// * [Dom.link]
  /// * [Dom.source]
  /// * [Dom.style]
  dynamic media;

  /// Allows 2 or more [Dom.audio] / [Dom.video] elements to be kept synchronized.
  dynamic mediaGroup;

  /// Defines which HTTP method to use when submitting a [Dom.form]. Can be GET (default) or POST.
  ///
  /// Allowed values are:
  ///
  /// * `GET`
  /// * `POST`
  dynamic method;

  /// Indicates the minimum [value] allowed for a [Dom.input], [Dom.meter] or [Dom.progress].
  ///
  /// Related: [max]
  dynamic min;

  /// Indicates whether multiple values can be entered in a [Dom.input] _(of type `email` or `file`)_,
  /// or if multiple [Dom.option]s can be selected for a [Dom.select].
  bool multiple;

  /// Indicates whether the audio will be initially silenced for a [Dom.video] on page load.
  bool muted;

  /// The name of the element _(or group of elements in the case of `<input type="radio">`)_.
  ///
  /// Used to identify fields when a [Dom.form] is submitted.
  ///
  /// __HTML Radio Button Example:__
  ///
  ///     @override
  ///     render() {
  ///       return Dom.form()(
  ///         Dom.label()(
  ///           (Dom.input()
  ///             ..type = 'radio'
  ///             // This must match the `name` of all other radio buttons that should
  ///             // never be selected at the same time.
  ///             ..name = 'group-of-buttons-descriptor'
  ///             ..value = 'unique-value'
  ///             ..id = 'unique-id'
  ///           )(),
  ///           'Label for first radio button'
  ///         ),
  ///         Dom.label()(
  ///           (Dom.input()
  ///             ..type = 'radio'
  ///             // This must match the `name` of all other radio buttons that should
  ///             // never be selected at the same time.
  ///             ..name = 'group-of-buttons-descriptor'
  ///             ..value = 'unique-value-2'
  ///             ..id = 'unique-id-2'
  ///           )(),
  ///           'Label for second radio button'
  ///         )
  ///       )
  ///     }
  dynamic name;

  /// Indicates whether a [Dom.form] should be validated when submitted.
  ///
  /// Related: [onSubmit], [formNoValidate]
  bool noValidate;

  /// Indicates whether the [Dom.details] will be shown on page load.
  dynamic open;

  /// Defines a regular expression which [Dom.input]'s [value] will be validated against.
  dynamic pattern;

  /// Provides a hint to the user of what can be entered in the [Dom.input] or [Dom.textarea].
  dynamic placeholder;

  /// A URL to an image that will display until the user plays or seeks within a [Dom.video].
  dynamic poster;

  /// Indicates how much of a [Dom.audio] or [Dom.video] should be pre-loaded.
  ///
  /// Allowed values are:
  ///
  /// * `auto` (The entire video / audio clip)
  /// * `metadata` (Only metadata)
  /// * `none`
  dynamic preload;

  /// Specifies the name of the group of `<command>`s that will be toggled when the command itself is activated/toggled.
  ///
  /// __Extremely limited browser support. Use with caution.__
  dynamic radioGroup;

  /// Indicates whether the contents of a [Dom.input] or [Dom.textarea] can be modified.
  ///
  /// Related: [disabled]
  bool readOnly;

  /// Specifies the relationship of the target ([href]) object to the [Dom.a] / [Dom.area] / [Dom.link].
  dynamic rel;

  /// HTML5 form validation attribute that indicates whether a [Dom.input], [Dom.textarea] or [Dom.select]
  /// must have a non-null value when a [Dom.form] is submitted.
  bool required;

  /// Annotates semantic information about the purpose of an element for accessibility purposes.
  ///
  /// See [Role] for possible values.
  ///
  /// __Example:__
  ///
  ///     @override
  ///     render() {
  ///       return (Dom.div()..role = Role.button)(
  ///         'I am a <div> masquerading as a <button>!'
  ///       );
  ///     }
  dynamic role;

  /// Defines the number of rows in a [Dom.textarea].
  int rows;

  /// Defines the number of rows a [Dom.td] or [Dom.th] should span over.
  ///
  /// Related: [colSpan]
  ///
  /// TODO: Change to an `int` in the `2.0.0` release
  /*int*/ dynamic rowSpan;

  /// Enables an extra set of restrictions for the content in a [Dom.iframe].
  ///
  /// When set, it will:
  ///
  /// * Treat the content as being from a unique origin
  /// * Block form submission
  /// * Block script execution
  /// * Disable APIs
  /// * Prevent links from targeting other browsing contexts
  /// * Prevent content from using plugins (through <embed>, <object>, <applet>, or other)
  /// * Prevent the content to navigate its top-level browsing context
  /// * Block automatically triggered features
  ///   _(such as automatically playing a video or automatically focusing a form control)_
  ///
  /// Allowed values are:
  ///
  /// * `''` (All restrictions applied) _or a space separated list of the following:_
  /// * `allow-forms` (Enables form submission)
  /// * `allow-pointer-lock` (Enables APIs)
  /// * `allow-popups` (Enables popups)
  /// * `allow-same-origin` (Allows the iframe content to be treated as being from the same origin)
  /// * `allow-scripts` (Enables scripts)
  /// * `allow-top-navigation` (Allows the iframe content to navigate its top-level browsing context)
  dynamic sandbox;

  /// Specifies whether a [Dom.th] is a header for a column, row, or group of columns or rows.
  ///
  /// Allowed values are:
  ///
  /// * `col`
  /// * `row`
  /// * `colgroup`
  /// * `rowgroup`
  dynamic scope;

  /// Specifies whether to show scrollbars for a [Dom.iframe].
  ///
  /// __DO NOT USE.__ This attribute is obselete in HTML5.
  @Deprecated('2.0.0')
  dynamic scrolling;

  /// Indicates whether a [Dom.iframe] should be rendered without borders or scrollbars.
  bool seamless;

  /// Set on a [Dom.option] to define the `value` that will be set on the parent [Dom.select] when the page loads.
  bool selected;

  /// Defines how [coords] should be interpreted for a [Dom.area].
  ///
  /// __Example:__
  ///
  ///     @override
  ///     render() {
  ///       return Dom.div()(
  ///         (Dom.img()
  ///           ..src = '/some/path/to-an-image.png'
  ///           ..useMap = 'shapes-map'
  ///         )(),
  ///         (Dom.map()..name = 'shapes-map')(
  ///           (Dom.area()
  ///             ..shape = 'rect'
  ///             ..title = 'square'
  ///             ..coords = '19,28,222,228'
  ///             ..href = '/go/here/when-they-click-on-the-rectangle'
  ///           )(),
  ///           (Dom.area()
  ///             ..shape = 'circle'
  ///             ..title = 'circle'
  ///             ..coords = '361,132,96'
  ///             ..href = '/go/here/when-they-click-on-the-circle'
  ///           )()
  ///         )
  ///       );
  ///     }
  ///
  /// See: <http://html.com/attributes/area-shape/>
  dynamic shape;

  /// The HTML `size` attribute for use on a [Dom.input] or [Dom.select].
  ///
  /// * Defines the width of the element (in pixels).
  /// * If the element's [type] attribute is text or password then it's the number of characters.
  int size;

  /// Specifies size-related metadata about a linked resource.
  ///
  /// __[Dom.link] usage:__
  ///
  ///     (Dom.link()
  ///       ..rel = 'icon'
  ///       ..href = 'some-icon.gif'
  ///       ..type = 'image/gif'
  ///       ..sizes = '16x16'
  ///     )()
  ///
  /// __[Dom.img] usage (alongside [srcSet]):__
  ///
  ///     (Dom.img()
  ///       ..src = 'default.jpg'
  ///       ..srcSet = 'large.jpg 1024w, medium.jpg 640w, small.jpg 320w'
  ///       ..sizes = '(min-width: 36em) 33.3vw, 100v2'
  ///       ..alt = 'A rad wolf'
  ///     )()
  ///
  /// See: <https://css-tricks.com/responsive-images-youre-just-changing-resolutions-use-srcset/>
  dynamic sizes;

  /// Defines the number of columns a [Dom.col] or [Dom.colgroup].
  ///
  /// Related: [colSpan]
  int span;

  /// Indicates whether spell checking is allowed for the element.
  dynamic spellCheck;

  /// The URL of the embeddable content.
  dynamic src;

  /// Specifies the HTML content of the page to show in the [Dom.iframe].
  ///
  /// > Expected to be used together with [sandbox] and [seamless].
  ///
  /// * If a browser supports the `srcdoc` attribute, it will override the content
  ///   specified in the [src] attribute _(if present)_.
  /// * If a browser does NOT support the `srcdoc` attribute, it will show the file
  ///   specified in the src attribute instead _(if present)_.
  dynamic srcDoc;

  /// Use alongside [src] on a [Dom.img] to provide extra information to help a browser decide
  /// which image to display.
  ///
  /// __Example:__
  ///
  ///     (Dom.img()
  ///       ..src = 'small.jpg'
  ///       ..srcSet = 'medium.jpg 1000w, large.jpg 2000w'
  ///       ..alt = 'yah'
  ///     )()
  ///
  /// See: <https://css-tricks.com/responsive-images-youre-just-changing-resolutions-use-srcset/>
  dynamic srcSet;

  /// Defines the first number if other than `1` for an ordered list ([Dom.ol]).
  int start;

  /// Works with the [min] and [max] props to limit the increments at which a numeric value can be set on a
  /// [Dom.input] when [type] is set to `number` or `range`.
  ///
  /// It can be set to `'any'`, or a positive floating point number.
  dynamic step;

  /// An inline CSS style for the element.
  ///
  ///     ..style = {
  ///       'width': '${state.progress * 100}%',
  ///       'display': state.isHidden ? 'none' : '',
  ///     }
  ///
  /// See: <https://facebook.github.io/react/tips/inline-styles.html>
  Map<String, dynamic> style;

  /// Specifies the order that an element should be focused when the user is utilizing the `TAB` key to navigate
  /// elements on the page.
  dynamic tabIndex;

  /// Specifies where to open the contents of the provided [href].
  dynamic target;

  /// Text to be displayed in a "tooltip" when hovering over the element.
  String title;

  /// Defines the type of the element.
  dynamic type;

  /// Specifies an image _(or an object)_ as an image-map.
  ///
  /// Creates a semantic relationship between the [Dom.img] and the [Dom.map] that has a [name] or [id]
  /// attribute value that matches this one.
  dynamic useMap;

  /// The value of the [Dom.input] / [Dom.textarea] / [Dom.select] when rendered.
  ///
  /// > When set to a non-null value, a "controlled" React component will be rendered, meaning that you must
  /// > use [onChange] to keep the input updated based on user interactions.
  /// >
  /// > See: <https://facebook.github.io/react/docs/forms.html#controlled-components>
  ///
  /// Related: [defaultValue]
  dynamic value;

  /// Specifies the width _(in pixels)_ of the following elements:
  ///
  /// * [Dom.canvas]
  /// * [Dom.embed]
  /// * [Dom.iframe]
  /// * [Dom.img]
  /// * [Dom.input]
  /// * [Dom.object]
  /// * [Dom.video]
  ///
  /// __For all other elements, use the CSS height property instead.__
  ///
  /// TODO: Change to an `int` in the `2.0.0` release
  /*int*/ dynamic width;

  /// Set on a [Dom.embed] element that loads an Adobe Flash movie.
  ///
  /// Allowed values are:
  ///
  /// * `window`
  /// * `opaque`
  /// * `transparent`
  dynamic wmode;

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

  ClipboardEventCallback onCopyCapture, onCutCapture, onPasteCapture;
  KeyboardEventCallback onKeyDownCapture, onKeyPressCapture, onKeyUpCapture;
  FocusEventCallback onFocusCapture, onBlurCapture;
  FormEventCallback onChangeCapture, onInputCapture, onSubmitCapture, onResetCapture;
  MouseEventCallback
    onClickCapture, onContextMenuCapture, onDoubleClickCapture, onDragCapture, onDragEndCapture, onDragEnterCapture, onDragExitCapture, onDragLeaveCapture, onDragOverCapture,
    onDragStartCapture, onDropCapture, onMouseDownCapture, onMouseEnterCapture, onMouseLeaveCapture, onMouseMoveCapture, onMouseOutCapture, onMouseOverCapture, onMouseUpCapture;
  TouchEventCallback onTouchCancelCapture, onTouchEndCapture, onTouchMoveCapture, onTouchStartCapture;
  UIEventCallback onScrollCapture;
  WheelEventCallback onWheelCapture;
}

@PropsMixin(keyNamespace: '')
abstract class SvgPropsMixin {
  Map get props;

  dynamic clipPath, cx, cy, d, dx, dy, fill, fillOpacity, fontFamily, fontSize, fx, fy, gradientTransform,
    gradientUnits, markerEnd, markerMid, markerStart, offset, opacity, patternContentUnits, patternUnits, points,
    preserveAspectRatio, r, rx, ry, spreadMethod, stopColor, stopOpacity, stroke, strokeDasharray, strokeLinecap,
    strokeOpacity, strokeWidth, textAnchor, transform, version, viewBox, x1, x2, x, xlinkActuate, xlinkArcrole,
    xlinkHref, xlinkRole, xlinkShow, xlinkTitle, xlinkType, xmlBase, xmlLang, xmlSpace, y1, y2, y;
}

/// Typed getters/setters for reserved DOM-related props that can be used by __all__ [Dom] components.
///
/// To be used as a mixin for React components and builders.
@PropsMixin(keyNamespace: '')
abstract class UbiquitousDomPropsMixin {
  Map get props;

  /// Whether the element if focusable.
  /// Must be a valid integer or String of valid integer.
  dynamic tabIndex;

  /// Unique identifier for an element.
  ///
  /// Must be unique amongst all the ids, and contain at least one character.
  String id;

  /// Text to be displayed in a "tooltip" when hovering over the element.
  String title;

  /// An inline CSS style for the element.
  ///
  ///     ..style = {
  ///       'width': '${state.progress * 100}%',
  ///       'display': state.isHidden ? 'none' : '',
  ///     }
  ///
  /// See: <https://facebook.github.io/react/tips/inline-styles.html>
  Map<String, dynamic> style;

  /// Callback for when the user copies the content of an element
  ClipboardEventCallback onCopy;

  /// Callback for when the user cuts the content of an element
  ClipboardEventCallback onCut;

  /// Callback for when the user pastes some content in an element
  ClipboardEventCallback onPaste;

  /// Callback for when the user is pressing a key
  KeyboardEventCallback onKeyDown;

  /// Callback for when the user presses a key
  KeyboardEventCallback onKeyPress;

  /// Callback for when the user releases a key
  KeyboardEventCallback onKeyUp;

  /// Callback for when an element gets focus
  FocusEventCallback onFocus;

  /// Callback for when an element loses focus
  FocusEventCallback onBlur;

  /// Callback for  when the content of a form element, the selection, or the checked state have changed (for <input>,
  /// <keygen>, <select>, and <textarea>)
  FormEventCallback onChange;

  /// Callback for when an element gets user input
  FormEventCallback onInput;

  /// Callback for when a form is submitted
  FormEventCallback onSubmit;

  /// Callback for when a form is reset
  FormEventCallback onReset;

  /// Callback for when the user clicks on an element
  MouseEventCallback onClick;

  /// Callback for when the user right-clicks on an element to open a context menu
  MouseEventCallback onContextMenu;

  /// Callback for when the user double-clicks on an element
  MouseEventCallback onDoubleClick;

  /// Callback for when an element is being dragged
  MouseEventCallback onDrag;

  /// Callback for when the user has finished dragging an element
  MouseEventCallback onDragEnd;

  /// Callback for when the dragged element enters the drop target
  MouseEventCallback onDragEnter;

  /// Callback for when the dragged element exits the drop target
  MouseEventCallback onDragExit;

  /// Callback for when the dragged element leaves the drop target
  MouseEventCallback onDragLeave;

  /// Callback for when the dragged element is over the drop target
  MouseEventCallback onDragOver;

  /// Callback for when the user starts to drag an element
  MouseEventCallback onDragStart;

  /// Callback for when the dragged element is dropped on the drop target
  MouseEventCallback onDrop;

  /// Callback for when the user presses a mouse button over an element
  MouseEventCallback onMouseDown;

  /// Callback for when the pointer is moved onto an element
  MouseEventCallback onMouseEnter;

  /// Callback for when the pointer is moved out of an element
  MouseEventCallback onMouseLeave;

  /// Callback for when the pointer is moving while it is over an element
  MouseEventCallback onMouseMove;

  /// Callback for when a user moves the mouse pointer out of an element, or out of one of its children
  MouseEventCallback onMouseOut;

  /// Callback for when the pointer is moved onto an element, or onto one of its children
  MouseEventCallback onMouseOver;

  /// Callback for when a user releases a mouse button over an element
  MouseEventCallback onMouseUp;

  /// Callback for when the touch is interrupted
  TouchEventCallback onTouchCancel;

  /// Callback for when a finger is removed from a touch screen
  TouchEventCallback onTouchEnd;

  /// Callback for when a finger is dragged across the screen
  TouchEventCallback onTouchMove;

  /// Callback for when a finger is placed on a touch screen
  TouchEventCallback onTouchStart;

  /// Callback for when an element's scrollbar is being scrolled
  UIEventCallback onScroll;

  /// Callback for when the mouse wheel rolls up or down over an element
  WheelEventCallback onWheel;
}
