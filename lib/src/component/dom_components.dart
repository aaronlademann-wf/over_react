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

/// [UiComponent]-based api with typed props for react-dart DOM components.
library over_react.dom_components;

import 'dart:html';
import 'dart:svg' as d_svg;

import 'package:over_react/src/component/prop_mixins.dart';
import 'package:over_react/src/component_declaration/component_base.dart' as component_base;
import 'package:react/react.dart' as react;
import 'package:react/react_client.dart';

/// Returns a new instance [DomProps], optionally backed by a specified Map.
///
/// Convenient for adding DOM props inline to non-DOM components:
///
///     SomeComponentProps theseProps = SomeComponent.props;
///
///     theseProps
///       ..addProps(domProps()..style = {'display': 'none'})
///       ..addProps(domProps()
///         ..id = 'my_component'
///         ..title = 'tooltip for my component'
///       )
DomProps domProps([Map backingMap]) => new DomProps(null, backingMap);

typedef DomProps DomPropsFactory();

class DomProps extends component_base.UiProps with DomPropsMixin, ReactPropsMixin {
  // Wrap Map literal in parens to work around https://github.com/dart-lang/sdk/issues/24410
  DomProps(this.componentFactory, [Map props]) : this.props = props ?? ({});

  @override
  final ReactDomComponentFactoryProxy componentFactory;
  @override
  final Map props;
}

class SvgProps extends component_base.UiProps with DomPropsMixin, ReactPropsMixin, SvgPropsMixin implements DomProps {
  // Wrap Map literal in parens to work around https://github.com/dart-lang/sdk/issues/24410
  SvgProps(this.componentFactory, [Map props]) : this.props = props ?? ({});

  @override
  final ReactDomComponentFactoryProxy componentFactory;
  @override
  final Map props;
}

/// A class that provides namespacing for static DOM component factory methods, much like `React.DOM` in React JS.
///
/// __Example of rendering a DOM component factory:__
///
///     @override
///     render() {
///       return (Dom.div()..className = 'my-div')(
///         // Children
///       );
///     }
abstract class Dom {
  /// Returns a new [DomPropsMixin] that renders an [AnchorElement]
  /// with getters/setters for all DOM-related props.
  static DomProps a() => new DomProps(react.a);
  /// Returns a new [DomPropsMixin] that renders an HTML `<abbr>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps abbr() => new DomProps(react.abbr);
  /// Returns a new [DomPropsMixin] that renders an HTML `<address>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps address() => new DomProps(react.address);
  /// Returns a new [DomPropsMixin] that renders an [AreaElement]
  /// with getters/setters for all DOM-related props.
  static DomProps area() => new DomProps(react.area);
  /// Returns a new [DomPropsMixin] that renders an HTML `<article>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps article() => new DomProps(react.article);
  /// Returns a new [DomPropsMixin] that renders an HTML `<aside>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps aside() => new DomProps(react.aside);
  /// Returns a new [DomPropsMixin] that renders an [AudioElement]
  /// with getters/setters for all DOM-related props.
  static DomProps audio() => new DomProps(react.audio);
  /// Returns a new [DomPropsMixin] that renders an HTML `<b>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps b() => new DomProps(react.b);
  /// Returns a new [DomPropsMixin] that renders a [BaseElement]
  /// with getters/setters for all DOM-related props.
  static DomProps base() => new DomProps(react.base);
  /// Returns a new [DomPropsMixin] that renders an HTML `<bdi>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps bdi() => new DomProps(react.bdi);
  /// Returns a new [DomPropsMixin] that renders an HTML `<bdo>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps bdo() => new DomProps(react.bdo);
  /// Returns a new [DomPropsMixin] that renders an HTML `<big>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps big() => new DomProps(react.big);
  /// Returns a new [DomPropsMixin] that renders a [QuoteElement]
  /// with getters/setters for all DOM-related props.
  static DomProps blockquote() => new DomProps(react.blockquote);
  /// Returns a new [DomPropsMixin] that renders a [BodyElement]
  /// with getters/setters for all DOM-related props.
  static DomProps body() => new DomProps(react.body);
  /// Returns a new [DomPropsMixin] that renders a [BRElement]
  /// with getters/setters for all DOM-related props.
  static DomProps br() => new DomProps(react.br);
  /// Returns a new [DomPropsMixin] that renders a [ButtonElement]
  /// with getters/setters for all DOM-related props.
  static DomProps button() => new DomProps(react.button);
  /// Returns a new [DomPropsMixin] that renders a [CanvasElement]
  /// with getters/setters for all DOM-related props.
  static DomProps canvas() => new DomProps(react.canvas);
  /// Returns a new [DomPropsMixin] that renders a [TableCaptionElement]
  /// with getters/setters for all DOM-related props.
  static DomProps caption() => new DomProps(react.caption);
  /// Returns a new [DomPropsMixin] that renders an HTML `<cite>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps cite() => new DomProps(react.cite);
  /// Returns a new [DomPropsMixin] that renders an HTML `<code>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps code() => new DomProps(react.code);
  /// Returns a new [DomPropsMixin] that renders a [TableColElement]
  /// with getters/setters for all DOM-related props.
  static DomProps col() => new DomProps(react.col);
  /// Returns a new [DomPropsMixin] that renders a [TableColGroupElement]
  /// with getters/setters for all DOM-related props.
  static DomProps colgroup() => new DomProps(react.colgroup);
  /// Returns a new [DomPropsMixin] that renders an HTML `<data>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps data() => new DomProps(react.data);
  /// Returns a new [DomPropsMixin] that renders a [DataListElement]
  /// with getters/setters for all DOM-related props.
  static DomProps datalist() => new DomProps(react.datalist);
  /// Returns a new [DomPropsMixin] that renders an HTML `<dd>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps dd() => new DomProps(react.dd);
  /// Returns a new [DomPropsMixin] that renders an HTML `<del>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps del() => new DomProps(react.del);
  /// Returns a new [DomPropsMixin] that renders a [DetailsElement]
  /// with getters/setters for all DOM-related props.
  static DomProps details() => new DomProps(react.details);
  /// Returns a new [DomPropsMixin] that renders an HTML `<dfn>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps dfn() => new DomProps(react.dfn);
  /// Returns a new [DomPropsMixin] that renders an HTML `<dialog>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps dialog() => new DomProps(react.dialog);
  /// Returns a new [DomPropsMixin] that renders a [DivElement]
  /// with getters/setters for all DOM-related props.
  static DomProps div() => new DomProps(react.div);
  /// Returns a new [DomPropsMixin] that renders a [DListElement]
  /// with getters/setters for all DOM-related props.
  static DomProps dl() => new DomProps(react.dl);
  /// Returns a new [DomPropsMixin] that renders an HTML `<dt>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps dt() => new DomProps(react.dt);
  /// Returns a new [DomPropsMixin] that renders an HTML `<em>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps em() => new DomProps(react.em);
  /// Returns a new [DomPropsMixin] that renders an [EmbedElement]
  /// with getters/setters for all DOM-related props.
  static DomProps embed() => new DomProps(react.embed);
  /// Returns a new [DomPropsMixin] that renders a [FieldSetElement]
  /// with getters/setters for all DOM-related props.
  static DomProps fieldset() => new DomProps(react.fieldset);
  /// Returns a new [DomPropsMixin] that renders an HTML `<figcaption>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps figcaption() => new DomProps(react.figcaption);
  /// Returns a new [DomPropsMixin] that renders an HTML `<figure>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps figure() => new DomProps(react.figure);
  /// Returns a new [DomPropsMixin] that renders an HTML `<footer>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps footer() => new DomProps(react.footer);
  /// Returns a new [DomPropsMixin] that renders a [FormElement]
  /// with getters/setters for all DOM-related props.
  static DomProps form() => new DomProps(react.form);
  /// Returns a new [DomPropsMixin] that renders a [HeadingElement.h1]
  /// with getters/setters for all DOM-related props.
  static DomProps h1() => new DomProps(react.h1);
  /// Returns a new [DomPropsMixin] that renders a [HeadingElement.h2]
  /// with getters/setters for all DOM-related props.
  static DomProps h2() => new DomProps(react.h2);
  /// Returns a new [DomPropsMixin] that renders a [HeadingElement.h3]
  /// with getters/setters for all DOM-related props.
  static DomProps h3() => new DomProps(react.h3);
  /// Returns a new [DomPropsMixin] that renders a [HeadingElement.h4]
  /// with getters/setters for all DOM-related props.
  static DomProps h4() => new DomProps(react.h4);
  /// Returns a new [DomPropsMixin] that renders a [HeadingElement.h5]
  /// with getters/setters for all DOM-related props.
  static DomProps h5() => new DomProps(react.h5);
  /// Returns a new [DomPropsMixin] that renders a [HeadingElement.h6]
  /// with getters/setters for all DOM-related props.
  static DomProps h6() => new DomProps(react.h6);
  /// Returns a new [DomPropsMixin] that renders a [HeadElement]
  /// with getters/setters for all DOM-related props.
  static DomProps head() => new DomProps(react.head);
  /// Returns a new [DomPropsMixin] that renders an HTML `<header>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps header() => new DomProps(react.header);
  /// Returns a new [DomPropsMixin] that renders a [HRElement]
  /// with getters/setters for all DOM-related props.
  static DomProps hr() => new DomProps(react.hr);
  /// Returns a new [DomPropsMixin] that renders a [HtmlHtmlElement]
  /// with getters/setters for all DOM-related props.
  static DomProps html() => new DomProps(react.html);
  /// Returns a new [DomPropsMixin] that renders an HTML `<i>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps i() => new DomProps(react.i);
  /// Returns a new [DomPropsMixin] that renders an [IFrameElement]
  /// with getters/setters for all DOM-related props.
  static DomProps iframe() => new DomProps(react.iframe);
  /// Returns a new [DomPropsMixin] that renders an [ImageElement]
  /// with getters/setters for all DOM-related props.
  static DomProps img() => new DomProps(react.img);
  /// Returns a new [DomPropsMixin] that renders an [InputElement]
  /// with getters/setters for all DOM-related props.
  static DomProps input() => new DomProps(react.input);
  /// Returns a new [DomPropsMixin] that renders an HTML `<ins>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps ins() => new DomProps(react.ins);
  /// Returns a new [DomPropsMixin] that renders an HTML `<kbd>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps kbd() => new DomProps(react.kbd);
  /// Returns a new [DomPropsMixin] that renders a [KeygenElement]
  /// with getters/setters for all DOM-related props.
  static DomProps keygen() => new DomProps(react.keygen);
  /// Returns a new [DomPropsMixin] that renders a [LabelElement]
  /// with getters/setters for all DOM-related props.
  static DomProps label() => new DomProps(react.label);
  /// Returns a new [DomPropsMixin] that renders a [LegendElement]
  /// with getters/setters for all DOM-related props.
  static DomProps legend() => new DomProps(react.legend);
  /// Returns a new [DomPropsMixin] that renders a [LIElement]
  /// with getters/setters for all DOM-related props.
  static DomProps li() => new DomProps(react.li);
  /// Returns a new [DomPropsMixin] that renders a [LinkElement]
  /// with getters/setters for all DOM-related props.
  static DomProps link() => new DomProps(react.link);
  /// Returns a new [DomPropsMixin] that renders an HTML `<main>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps main() => new DomProps(react.main);
  /// Returns a new [DomPropsMixin] that renders a [MapElement]
  /// with getters/setters for all DOM-related props.
  static DomProps map() => new DomProps(react.map);
  /// Returns a new [DomPropsMixin] that renders an HTML `<mark>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps mark() => new DomProps(react.mark);
  /// Returns a new [DomPropsMixin] that renders a [MenuElement]
  /// with getters/setters for all DOM-related props.
  static DomProps menu() => new DomProps(react.menu);
  /// Returns a new [DomPropsMixin] that renders an HTML `<menuitem>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps menuitem() => new DomProps(react.menuitem);
  /// Returns a new [DomPropsMixin] that renders a [MetaElement]
  /// with getters/setters for all DOM-related props.
  static DomProps meta() => new DomProps(react.meta);
  /// Returns a new [DomPropsMixin] that renders a [MeterElement]
  /// with getters/setters for all DOM-related props.
  static DomProps meter() => new DomProps(react.meter);
  /// Returns a new [DomPropsMixin] that renders an HTML `<nav>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps nav() => new DomProps(react.nav);
  /// Returns a new [DomPropsMixin] that renders an HTML `<noscript>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps noscript() => new DomProps(react.noscript);
  /// Returns a new [DomPropsMixin] that renders an [ObjectElement]
  /// with getters/setters for all DOM-related props.
  static DomProps object() => new DomProps(react.object);
  /// Returns a new [DomPropsMixin] that renders an [OListElement]
  /// with getters/setters for all DOM-related props.
  static DomProps ol() => new DomProps(react.ol);
  /// Returns a new [DomPropsMixin] that renders an [OptGroupElement]
  /// with getters/setters for all DOM-related props.
  static DomProps optgroup() => new DomProps(react.optgroup);
  /// Returns a new [DomPropsMixin] that renders an HTML `<option>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps option() => new DomProps(react.option);
  /// Returns a new [DomPropsMixin] that renders an [OutputElement]
  /// with getters/setters for all DOM-related props.
  static DomProps output() => new DomProps(react.output);
  /// Returns a new [DomPropsMixin] that renders a [ParagraphElement]
  /// with getters/setters for all DOM-related props.
  static DomProps p() => new DomProps(react.p);
  /// Returns a new [DomPropsMixin] that renders a [ParamElement]
  /// with getters/setters for all DOM-related props.
  static DomProps param() => new DomProps(react.param);
  /// Returns a new [DomPropsMixin] that renders an HTML `<picture>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps picture() => new DomProps(react.picture);
  /// Returns a new [DomPropsMixin] that renders a [PreElement]
  /// with getters/setters for all DOM-related props.
  static DomProps pre() => new DomProps(react.pre);
  /// Returns a new [DomPropsMixin] that renders a [ProgressElement]
  /// with getters/setters for all DOM-related props.
  static DomProps progress() => new DomProps(react.progress);
  /// Returns a new [DomPropsMixin] that renders a [QuoteElement]
  /// with getters/setters for all DOM-related props.
  static DomProps q() => new DomProps(react.q);
  /// Returns a new [DomPropsMixin] that renders an HTML `<rp>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps rp() => new DomProps(react.rp);
  /// Returns a new [DomPropsMixin] that renders an HTML `<rt>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps rt() => new DomProps(react.rt);
  /// Returns a new [DomPropsMixin] that renders an HTML `<ruby>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps ruby() => new DomProps(react.ruby);
  /// Returns a new [DomPropsMixin] that renders an HTML `<s>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps s() => new DomProps(react.s);
  /// Returns a new [DomPropsMixin] that renders an HTML `<samp>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps samp() => new DomProps(react.samp);
  /// Returns a new [DomPropsMixin] that renders a [ScriptElement]
  /// with getters/setters for all DOM-related props.
  static DomProps script() => new DomProps(react.script);
  /// Returns a new [DomPropsMixin] that renders an HTML `<section>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps section() => new DomProps(react.section);
  /// Returns a new [DomPropsMixin] that renders a [SelectElement]
  /// with getters/setters for all DOM-related props.
  static DomProps select() => new DomProps(react.select);
  /// Returns a new [DomPropsMixin] that renders an HTML `<small>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps small() => new DomProps(react.small);
  /// Returns a new [DomPropsMixin] that renders a [SourceElement]
  /// with getters/setters for all DOM-related props.
  static DomProps source() => new DomProps(react.source);
  /// Returns a new [DomPropsMixin] that renders a [SpanElement]
  /// with getters/setters for all DOM-related props.
  static DomProps span() => new DomProps(react.span);
  /// Returns a new [DomPropsMixin] that renders an HTML `<strong>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps strong() => new DomProps(react.strong);
  /// Returns a new [DomPropsMixin] that renders a [StyleElement]
  /// with getters/setters for all DOM-related props.
  static DomProps style() => new DomProps(react.style);
  /// Returns a new [DomPropsMixin] that renders an HTML `<sub>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps sub() => new DomProps(react.sub);
  /// Returns a new [DomPropsMixin] that renders an HTML `<summary>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps summary() => new DomProps(react.summary);
  /// Returns a new [DomPropsMixin] that renders an HTML `<sup>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps sup() => new DomProps(react.sup);
  /// Returns a new [DomPropsMixin] that renders a [TableElement]
  /// with getters/setters for all DOM-related props.
  static DomProps table() => new DomProps(react.table);
  /// Returns a new [DomPropsMixin] that renders a `<tbody>` [TableSectionElement]
  /// with getters/setters for all DOM-related props.
  static DomProps tbody() => new DomProps(react.tbody);
  /// Returns a new [DomPropsMixin] that renders a `<td>` [TableCellElement]
  /// with getters/setters for all DOM-related props.
  static DomProps td() => new DomProps(react.td);
  /// Returns a new [DomPropsMixin] that renders a [TextAreaElement]
  /// with getters/setters for all DOM-related props.
  static DomProps textarea() => new DomProps(react.textarea);
  /// Returns a new [DomPropsMixin] that renders a `<tfoot>` [TableSectionElement]
  /// with getters/setters for all DOM-related props.
  static DomProps tfoot() => new DomProps(react.tfoot);
  /// Returns a new [DomPropsMixin] that renders a `<th>` [TableCellElement]
  /// with getters/setters for all DOM-related props.
  static DomProps th() => new DomProps(react.th);
  /// Returns a new [DomPropsMixin] that renders a `<thead>` [TableSectionElement]
  /// with getters/setters for all DOM-related props.
  static DomProps thead() => new DomProps(react.thead);
  /// Returns a new [DomPropsMixin] that renders an HTML `<time>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps time() => new DomProps(react.time);
  /// Returns a new [DomPropsMixin] that renders an HTML `<title>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps title() => new DomProps(react.title);
  /// Returns a new [DomPropsMixin] that renders a [TableRowElement]
  /// with getters/setters for all DOM-related props.
  static DomProps tr() => new DomProps(react.tr);
  /// Returns a new [DomPropsMixin] that renders a [TrackElement]
  /// with getters/setters for all DOM-related props.
  static DomProps track() => new DomProps(react.track);
  /// Returns a new [DomPropsMixin] that renders an HTML `<u>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps u() => new DomProps(react.u);
  /// Returns a new [DomPropsMixin] that renders a [UListElement]
  /// with getters/setters for all DOM-related props.
  static DomProps ul() => new DomProps(react.ul);
  /// Returns a new [DomPropsMixin] that renders an HTML `<var>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps variable() => new DomProps(react.variable);
  /// Returns a new [DomPropsMixin] that renders a [VideoElement]
  /// with getters/setters for all DOM-related props.
  static DomProps video() => new DomProps(react.video);
  /// Returns a new [DomPropsMixin] that renders an HTML `<wbr>` [Element]
  /// with getters/setters for all DOM-related props.
  static DomProps wbr() => new DomProps(react.wbr);

  // SVG Elements
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.CircleElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps circle() => new SvgProps(react.circle);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.GElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps g() => new SvgProps(react.g);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.DefsElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps defs() => new SvgProps(react.defs);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.EllipseElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps ellipse() => new SvgProps(react.ellipse);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.LineElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps line() => new SvgProps(react.line);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.LinearGradientElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps linearGradient() => new SvgProps(react.linearGradient);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.MaskElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps mask() => new SvgProps(react.mask);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.PathElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps path() => new SvgProps(react.path);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.PatternElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps pattern() => new SvgProps(react.pattern);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.PolygonElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps polygon() => new SvgProps(react.polygon);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.PolylineElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps polyline() => new SvgProps(react.polyline);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.RadialGradientElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps radialGradient() => new SvgProps(react.radialGradient);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.RectElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps rect() => new SvgProps(react.rect);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.SvgSvgElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps svg() => new SvgProps(react.svg);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.StopElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps stop() => new SvgProps(react.stop);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.TextElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps text() => new SvgProps(react.text);
  /// Returns a new [SvgPropsMixin] that renders a [d_svg.TSpanElement]
  /// with getters/setters for all SVG-related React props
  static SvgProps tspan() => new SvgProps(react.tspan);
}
