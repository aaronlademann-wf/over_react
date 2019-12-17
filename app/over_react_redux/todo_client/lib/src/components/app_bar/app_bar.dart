import 'dart:html';

import 'package:react/react.dart' as react;
import 'package:over_react/over_react.dart';

import 'package:todo_client/src/components/app_bar/app_bar_local_storage_menu.dart';
import 'package:react_material_ui/react_material_ui.dart';

final TodoAppBar = react.registerFunctionComponent((Map props) {
  final theme = useTheme();
  return Fragment()(
    AppBar(Map.of(props)..remove('onThemePaletteTypeToggle'),
      Toolbar({},
        Box({'flexGrow': 1},
          Typography({'variant': 'h6', 'className': classes['title']}, 'OverReact Todo Demo App'),
        ),
        // <FormControlLabel
        //        control={
        //          <Switch checked={state.checkedA} onChange={handleChange('checkedA')} value="checkedA" />
        //        }
        //        label="Secondary"
        //      />
        FormControlLabel({
          'control': Switch({
            'checked': theme.palette.type == 'light',
            'onChange': (SyntheticFormEvent event) {
              CheckboxInputElement target = event.target;
              final newThemePaletteType = target.checked ? 'light' : 'dark';
              (props['onThemePaletteTypeToggle'] as Function)(newThemePaletteType, theme);
            },
            'value': 'lightsAreOn',
          }),
          'label': 'Lights',
        }),
        AppBarLocalStorageMenu()(),
      ),
    ),
    Toolbar({'key': 'fakeAppBarToPushContentBelowFixedAppBar'}),
  );
}, displayName: 'TodoAppBar');
