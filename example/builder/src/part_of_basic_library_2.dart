// ignore_for_file: deprecated_member_use_from_same_package
part of basic.library;

mixin SuperPartOfLibPropsMixin on UiProps {
  String superProp;
}

abstract class SuperPartOfLibComponent<T extends SuperPartOfLibPropsMixin> extends UiComponent2<T> {
  @override
  get defaultProps => newProps()..id = 'super';

  @override
  render() {
    return Dom.div()('SuperPartOfLib', {
      'props.superProp': props.superProp,
    }.toString());
  }
}

UiFactory<SubPartOfLibProps> SubPartOfLib = _$SubPartOfLib; // ignore: undefined_identifier

mixin SubPartOfLibPropsMixin on UiProps, SuperPartOfLibPropsMixin {
  String subProp;
}

class SubPartOfLibProps = UiProps with SuperPartOfLibPropsMixin, SubPartOfLibPropsMixin;

class SubPartOfLibComponent extends SuperPartOfLibComponent<SubPartOfLibProps> {
  @override
  get defaultProps => newProps()..id = 'sub';

  @override
  render() {
    return Dom.div()('SubPartOfLib', {
      'props.subProp': props.subProp,
      'props.superProp': props.superProp,
    }.toString());
  }
}
