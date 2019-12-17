import 'dart:developer';

import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:react_material_ui/react_material_ui.dart';
import 'package:todo_client/src/store.dart';

part 'theme_provider.over_react.g.dart';

UiFactory<AppThemeProviderProps> AppThemeProvider = connect<AppState, AppThemeProviderProps>(
    mapStateToProps: (state) {
      return AppThemeProvider()..theme = state.theme;
    },
)(_$AppThemeProvider); // ignore: undefined_identifier

mixin AppThemeProviderPropsMixin on UiProps {
  @requiredProp
  MuiTheme theme;
}

class AppThemeProviderProps = UiProps with ConnectPropsMixin, AppThemeProviderPropsMixin;

class AppThemeProviderComponent extends UiComponent2<AppThemeProviderProps> {
  @override
  render() {
    final propsToForward = {...props}..remove('dispatch');
    print('props.theme.palette: ${props.theme.palette}');
    return ThemeProvider({...propsToForward, 'theme': JsBackedMap.from(props.theme).deepJsObject}, props['children']);
  }
}
