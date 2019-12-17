import 'dart:developer';

import 'package:over_react/over_react.dart';
import 'package:over_react/over_react_redux.dart';
import 'package:react/react_client.dart';
import 'package:react_material_ui/react_material_ui.dart';

import 'package:todo_client/src/actions.dart';
import 'package:todo_client/src/components/shared/redraw_counter_component_mixin.dart';
import 'package:todo_client/src/store.dart';
import 'package:todo_client/src/models/todo.dart';
import 'package:todo_client/src/models/user.dart';
import 'package:todo_client/src/components/app_bar/app_bar.dart';
import 'package:todo_client/src/components/create_input.dart';
import 'package:todo_client/src/components/todo_list.dart';
import 'package:todo_client/src/components/user_list.dart';
import 'package:todo_client/src/components/shared/theme_provider.dart';
import 'package:todo_client/src/theme.dart';

part 'app.over_react.g.dart';

UiFactory<TodoAppProps> TodoApp = connect<AppState, TodoAppProps>(
    mapDispatchToProps: (dispatch) {
      return (TodoApp()
        ..createTodo = (description) {
          dispatch(AddTodoAction(Todo(description: description)));
        }
        ..createUser = (name) {
          dispatch(AddUserAction(User(name: name)));
        }
        ..hitTheLights = (paletteType, theme) {
          // Must pass in a map with nothing but the palette type switch, otherwise
          // `createMuiTheme` will get a map with a full-blown theme - meaning certain values
          // like `palette.background` will not be derived from the new type on the JS side of the interop.
          // TODO: Is there a better way to handle merging theme updates?
          dispatch(UpdateThemeAction(
            getTodoAppTheme(theme..palette.type = paletteType)
//
          ));
        }
      );
    },
      // TODO (adl): This was added from master last time I rebased - look into if/why it is necessary.
    forwardRef: true,
)(_$TodoApp); // ignore: undefined_identifier

mixin TodoAppPropsMixin on UiProps {
  Function(String description) createTodo;

  Function(String name) createUser;

  Function(String paletteType, MuiTheme theme) hitTheLights;
}

//@Props(keyNamespace: '')
//mixin CommonMuiPropsMixin on UiProps {
//  Map classes;
//}

class TodoAppProps = UiProps with TodoAppPropsMixin, ConnectPropsMixin;

class TodoAppComponent extends UiComponent2<TodoAppProps> with RedrawCounterMixin {
  @override
  render() {
    // ignore: prefer_function_declarations_over_variables
    final StyledBox = withThemedStyles((theme) {
      final bgColor = theme.palette.background.defaultBg;
      print(theme.palette['background']);
      print('StyledBox: ${theme.palette.type}');
      print('bgColor: $bgColor');

      return {
        'root': {
          'backgroundColor': bgColor,
        },
      };
    })((props, [_]) {
      return Box({'className': props['classes']['root']}, props['children']);
    });

    return AppThemeProvider()(
      TodoAppBar({
        'color': 'primary',
        'className': 'something-custom',
        'innerClassName': 'something-custom__inner',
        'onThemePaletteTypeToggle': props.hitTheLights,
      }),
      StyledBox({
        'classes': {'root': 'app-content'},
      }, [
        CssBaseline({'key': 'cssBaseline'}),
        Container({'key': 'container', 'maxWidth': 'lg', 'className': 'app-content__container'},
          Grid({'container': true, 'direction': 'row', 'spacing': 3, 'className': 'app-content__container-grid'}, [
            renderTodosColumn(),
            renderUsersColumn(),
          ]),
        ),
      ]),
    );
  }

  ReactElement renderTodosColumn() {
    return Grid({
      'container': true,
      'item': true,
      'sm': 8,
      'direction': 'column',
      'alignItems': 'stretch',
      'style': {'height': '100%'},
    },
      (CreateInput()
        ..autoFocus = true
        ..label = 'New Todo'
        ..placeholder = 'Create new Todo'
        ..onCreate = props.createTodo
        ..addTestId('todo_client.createTodoInput')
      )(),
      (TodoList()..addTestId('todo_client.ConnectedTodoList'))(),
    );
  }

  ReactElement renderUsersColumn() {
    return Grid({
      'container': true,
      'item': true,
      'sm': 4,
      'direction': 'column',
      'style': {'height': '100%'},
    },
      (CreateInput()
        ..label = 'New User'
        ..placeholder = 'Create new User'
        ..onCreate = props.createUser
        ..addTestId('todo_client.createUserInput')
      )(),
      (UserList()..addTestId('todo_client.ConnectedUserList'))(),
    );
  }
}
