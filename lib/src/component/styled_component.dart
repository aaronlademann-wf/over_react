import 'dart:async';
import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:over_react/react_dom.dart' as react_dom;
import 'package:react/react_client.dart' show ReactDomComponentFactoryProxy;
// ignore: uri_has_not_been_generated
part 'styled_component.over_react.g.dart';

Map<String, ReactDomComponentFactoryProxy> _customElementFactories = {};
List<String> _globallyLoadedComponentStyles = [];

@PropsMixin()
abstract class StyledComponentPropsMixin implements UiProps {
  // ignore: const_initialized_with_non_constant_value, undefined_class, undefined_identifier
  static const PropsMeta meta = _$metaForStyledComponentPropsMixin;

  @override
  Map get props;

  UiFactory<DomProps> domElementFactory;
}

// TODO: adl there is still quite a bit of FOUC with this approach.
abstract class StyledComponentMixin {
  String get displayName;
  String get styles;
  List<String> get styleUrls;
  bool get loadStyleUrlsInShadowRoot;
  bool get renderIntoShadowDom => (loadStyleUrlsInShadowRoot && styleUrls.isNotEmpty) || styles.isNotEmpty;
  dynamic get renderedChildInstance;
  DomPropsFactory get domElementFactory;

  ShadowRoot get root => _root;
  ShadowRoot _root;

  bool isResolving = false;

  String get customElementName => displayName.replaceAll('_\$','').replaceAllMapped(new RegExp(r'(?!^)([A-Z])'), (match) =>
      '-${match[1]}').toLowerCase();

  ReactDomComponentFactoryProxy customElementFactory() {
    if (!_customElementFactories.keys.contains(customElementName)) {
      _customElementFactories[customElementName] = new ReactDomComponentFactoryProxy(customElementName);
    }

    return _customElementFactories[customElementName];
  }

  void handleStyledComponentWillMount() {
    if (renderIntoShadowDom) {
      if (loadStyleUrlsInShadowRoot && styleUrls.isNotEmpty) {
        isResolving = true;
      }

      try {
        document.registerElement(customElementName, WebComponent);
      } catch (err) {
        // already exists
      }
    } else {
      if (styleUrls.any((url) => !_globallyLoadedComponentStyles.contains(url))) {
        isResolving = true;
      }
    }
  }

  Future<bool> handleStyledComponentDidMount() async {
    if (renderIntoShadowDom) {
      final node = findDomNode(this);
      _root = node.shadowRoot ?? node.attachShadow({'mode': 'open'});
      react_dom.render(wrapContainer(), _root);
    }

    if (styleUrls.isNotEmpty && isResolving) {
      if (!loadStyleUrlsInShadowRoot) {
        List<LinkElement> newLinkElements = [];
        final stylesYetToBeLoaded = styleUrls.where((url) => !_globallyLoadedComponentStyles.contains(url));
        if (stylesYetToBeLoaded.isNotEmpty) {
          print('have not loaded $stylesYetToBeLoaded yet');
        }

        stylesYetToBeLoaded.forEach((url) {
          var link = new LinkElement()
            ..rel = 'stylesheet'
            ..href = url;
          newLinkElements.add(link);
          _globallyLoadedComponentStyles.add(url);
          document.head.append(link);
        });

        if (newLinkElements.isEmpty) {
          isResolving = false;
          return new Future.value(true);
        } else {
          isResolving = true;

          return Future.wait(newLinkElements.map((el) => el.onLoad.first).toList()).then((_) {
            isResolving = false;
            return true;
          });
        }
      } else {
        return Future.wait(linkedStyleElementRefs.values.map((el) => el.onLoad.first).toList()).then((_) {
          isResolving = false;
          return true;
        });
      }
    } else {
      isResolving = false;
      return new Future.value(false);
    }
  }

  void handleStyledComponentDidUpdate() {
    if (!renderIntoShadowDom) return;

    react_dom.render(wrapContainer(), _root);
  }

  void handleStyledComponentWillUnmount() {
    if (!renderIntoShadowDom) return;

    react_dom.unmountComponentAtNode(_root);
  }

  ReactElement get styleElement => (Dom.style()
    ..key = 'style'
    ..['dangerouslySetInnerHTML'] = {'__html': styles}
  )();

  Map<String, LinkElement> linkedStyleElementRefs = {};
  List<ReactElement> get linkedStyleElements => !loadStyleUrlsInShadowRoot ? [] : styleUrls.map((url) =>
      (Dom.link()
        ..key = url
        ..href = url
        ..rel = 'stylesheet'
        ..ref = (ref) { linkedStyleElementRefs[url] = ref; }
      )()
  ).toList();

  ReactElement wrapContainer() {
    var children = []
      ..add(styleElement)
      ..addAll(linkedStyleElements)
      ..add(cloneElement(renderedChildInstance, domProps()..key = getInstanceKey(renderedChildInstance) ?? 'child'));

    return domElementFactory()(children);
  }
}

/// A MapView with the typed getters/setters for [StyledComponentPropsMixin].
class StyledComponentPropsMapView extends UiPropsMapView
    with StyledComponentPropsMixin,
         // ignore: mixin_of_non_class, undefined_class
         $StyledComponentPropsMixin {
  /// Create a new instance backed by the specified map.
  StyledComponentPropsMapView(Map map) : super(map);
}

class WebComponent extends HtmlElement {
  WebComponent.created() : super.created() {
    this.attachShadow({'mode': 'open'});
  }
}
