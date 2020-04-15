import 'package:over_react/over_react.dart';

part 'private_component.over_react.g.dart';

UiFactory<_PrivateProps> _Private = _$_Private; // ignore: undefined_identifier

mixin _PrivateProps on UiProps {
  bool prop1;
}

mixin _PrivateState on UiState {
  bool state1;
}

class _PrivateComponent extends UiStatefulComponent2<_PrivateProps, _PrivateState> {
  @override
  get defaultProps => newProps()..prop1 = true;

  @override
  get initialState => newState()..state1 = true;

  @override
  render() {
    return Dom.div()('PrivateComponent', {
      'props.prop1': props.prop1,
      'props.state1': state.state1,
    }.toString());
  }
}
