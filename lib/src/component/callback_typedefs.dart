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

library over_react.callback_typedefs;

import 'package:react/react.dart' as react;

/// Generic event callback that takes a single [event] argument.
///
/// See: [react.SyntheticEvent]
typedef DomEventCallback(react.SyntheticEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticClipboardEvent]
typedef ClipboardEventCallback(react.SyntheticClipboardEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticKeyboardEvent]
typedef KeyboardEventCallback(react.SyntheticKeyboardEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticFocusEvent]
typedef FocusEventCallback(react.SyntheticFocusEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticFormEvent]
typedef FormEventCallback(react.SyntheticFormEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticMouseEvent]
typedef MouseEventCallback(react.SyntheticMouseEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticTouchEvent]
typedef TouchEventCallback(react.SyntheticTouchEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticUIEvent]
typedef UIEventCallback(react.SyntheticUIEvent event);

/// Event callback that takes a single [event] argument.
///
/// See: [react.SyntheticWheelEvent]
typedef WheelEventCallback(react.SyntheticWheelEvent event);

/// A generic callback that takes no arguments.
typedef Callback();
