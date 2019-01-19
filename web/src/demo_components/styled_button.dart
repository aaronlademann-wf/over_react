import 'package:over_react/over_react.dart';

import '../demo_components.dart';
// ignore: uri_has_not_been_generated
part 'styled_button.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<StyledButtonProps> StyledButton = _$StyledButton;

@Props()
class _$StyledButtonProps extends ButtonProps {}

@Component(styleUrls: ['sass/components/styled_button.css'])
class StyledButtonComponent extends UiComponent<StyledButtonProps> {
  @override
  Map getDefaultProps() => (newProps());

  @override
  void componentDidMount() {

  }

  @override
  render() {
    return (Button()..addProps(copyUnconsumedProps()))(props.children);
  }
}

// ignore: mixin_of_non_class, undefined_class
class StyledButtonProps extends _$StyledButtonProps with _$StyledButtonPropsAccessorsMixin {
  // ignore: undefined_identifier, undefined_class, const_initialized_with_non_constant_value
  static const PropsMeta meta = $metaForStyledButtonProps;
}
