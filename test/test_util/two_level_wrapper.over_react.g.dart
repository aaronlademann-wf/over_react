// GENERATED CODE - DO NOT MODIFY BY HAND

part of test_util.two_level_wrapper;

// **************************************************************************
// OverReactGenerator
// **************************************************************************

// React component factory implementation.
//
// Registers component implementation and links type meta to builder factory.
final $TwoLevelWrapperComponentFactory = registerComponent(
    () => new _$TwoLevelWrapperComponent(),
    builderFactory: TwoLevelWrapper,
    componentClass: TwoLevelWrapperComponent,
    isWrapper: true,
    parentType: null,
    displayName: 'TwoLevelWrapper');

abstract class _$TwoLevelWrapperPropsAccessorsMixin
    implements _$TwoLevelWrapperProps {
  @override
  Map get props;

  /* GENERATED CONSTANTS */

  static const List<PropDescriptor> $props = const [];
  static const List<String> $propKeys = const [];
}

const PropsMeta _$metaForTwoLevelWrapperProps = const PropsMeta(
  fields: _$TwoLevelWrapperPropsAccessorsMixin.$props,
  keys: _$TwoLevelWrapperPropsAccessorsMixin.$propKeys,
);

class TwoLevelWrapperProps extends _$TwoLevelWrapperProps
    with _$TwoLevelWrapperPropsAccessorsMixin {
  static const PropsMeta meta = _$metaForTwoLevelWrapperProps;
}

_$$TwoLevelWrapperProps _$TwoLevelWrapper([Map backingProps]) =>
    backingProps == null
        ? new _$$TwoLevelWrapperProps$JsMap(new JsBackedMap())
        : new _$$TwoLevelWrapperProps(backingProps);

// Concrete props implementation.
//
// Implements constructor and backing map, and links up to generated component factory.
class _$$TwoLevelWrapperProps extends _$TwoLevelWrapperProps
    with _$TwoLevelWrapperPropsAccessorsMixin
    implements TwoLevelWrapperProps {
  _$$TwoLevelWrapperProps._();
  factory _$$TwoLevelWrapperProps(Map backingMap) {
    if (backingMap is JsBackedMap) {
      return new _$$TwoLevelWrapperProps$PlainMap(backingMap);
    } else {
      return new _$$TwoLevelWrapperProps$JsMap(backingMap);
    }
  }

  /// Let [UiProps] internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The [ReactComponentFactory] associated with the component built by this class.
  @override
  ReactComponentFactoryProxy get componentFactory =>
      $TwoLevelWrapperComponentFactory;

  /// The default namespace for the prop getters/setters generated for this class.
  @override
  String get propKeyNamespace => 'TwoLevelWrapperProps.';
}

class _$$TwoLevelWrapperProps$PlainMap extends _$$TwoLevelWrapperProps {
  // This initializer of `_props` to an empty map, as well as the reassignment
  // of `_props` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$TwoLevelWrapperProps$PlainMap(Map backingMap)
      : this._props = {},
        super._() {
    this._props = backingMap ?? {};
  }

  /// The backing props map proxied by this class.
  @override
  Map get props => _props;
  Map _props;
}

class _$$TwoLevelWrapperProps$JsMap extends _$$TwoLevelWrapperProps {
  // This initializer of `_props` to an empty map, as well as the reassignment
  // of `_props` in the constructor body is necessary to work around an unknown ddc issue.
  // See <https://jira.atl.workiva.net/browse/CPLAT-4673> for more details
  _$$TwoLevelWrapperProps$JsMap(JsBackedMap backingMap)
      : this._props = new JsBackedMap(),
        super._() {
    this._props = backingMap ?? new JsBackedMap();
  }

  /// The backing props map proxied by this class.
  @override
  JsBackedMap get props => _props;
  JsBackedMap _props;
}

// Concrete component implementation mixin.
//
// Implements typed props/state factories, defaults `consumedPropKeys` to the keys
// generated for the associated props class.
class _$TwoLevelWrapperComponent extends TwoLevelWrapperComponent {
  @override
  _$$TwoLevelWrapperProps typedPropsFactory(Map backingMap) =>
      new _$$TwoLevelWrapperProps(backingMap);
  @override
  _$$TwoLevelWrapperProps$JsMap typedPropsFactoryJs(JsBackedMap backingMap) =>
      new _$$TwoLevelWrapperProps$JsMap(backingMap);

  /// Let [UiComponent] internals know that this class has been generated.
  @override
  bool get $isClassGenerated => true;

  /// The default consumed props, taken from _$TwoLevelWrapperProps.
  /// Used in [UiProps.consumedProps] if [consumedProps] is not overridden.
  @override
  final List<ConsumedProps> $defaultConsumedProps = const [
    _$metaForTwoLevelWrapperProps
  ];
  _$$TwoLevelWrapperProps$JsMap _cachedTypedProps;
  @override
  _$$TwoLevelWrapperProps$JsMap get props => _cachedTypedProps;
  @override
  set props(Map value) {
    super.props = value;
    _cachedTypedProps = typedPropsFactoryJs(value);
  }
}
