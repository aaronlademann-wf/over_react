import 'dart:html';

import 'package:redux/redux.dart';
import 'package:over_react/over_react.dart';

// Redux DevTool imports
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

/////////////////////////////// SHARED ///////////////////////////////

/// An action class can be created to add typing to the actions passed into dispatch.
class Action {
  Action({this.type, this.value});

  final String type;
  final dynamic value;

  toJson() {
    return {'type': this.type, 'value': this.value};
  }
}

/// Actions to be passed into `dispatch`.
class IncrementAction extends Action {
  IncrementAction([value]):super(type: 'INCREMENT', value:value);
}

class DecrementAction extends Action {
  DecrementAction([value]):super(type: 'DECREMENT', value:value);
}

/////////////////////////////// STORE 1 "Counter" ///////////////////////////////

/// The application store.
///
/// It takes in a reducer and the initial state. This store is also connected
/// to the Redux DevTools.
Store store1 = DevToolsStore<CounterState>(smallCountReducer, initialState: CounterState.defaultState(), middleware: [remoteDevtools]);

/// Code used to spin up the devtools.
var remoteDevtools = RemoteDevToolsMiddleware('127.0.0.1:8000');

Future initDevtools() async {
  remoteDevtools.store = store1;
  window.console.log('Navigate to 127.0.0.1:8000 in order to see Redux DevTools.');
  return remoteDevtools.connect();
}

class CounterState {
  final int count;
  final String name;

  CounterState({
    this.count,
    this.name,
  });

  CounterState.defaultState({this.count = 1, this.name = "Counter"});

  CounterState.updateState(CounterState oldState, {int count, String name})
      : this.count = count ?? oldState.count,
        this.name = name ?? oldState.name;

  toJson() {
    return {
      'count': this.count,
      'name': this.name
    };
  }
}

/// A reducer that returns a new state object.
CounterState smallCountReducer(CounterState oldState, dynamic action) {
  if (action is DecrementAction) {
    return CounterState.updateState(oldState, count: oldState.count - 1);
  } else if (action is IncrementAction) {
    return CounterState.updateState(oldState, count: oldState.count + 1);
  } else {
    return oldState;
  }
}

/////////////////////////////// STORE 2 "BigCounter" ///////////////////////////////

/// A new context that is used to differentiate the second store from the first.
final bigCounterContext = createContext();

/// The second store
Store store2 = Store<BigCounterState>(bigCounterStateReducer, initialState: BigCounterState(bigCount: 100));

class BigCounterState {
  final int bigCount;
  final String name;
  BigCounterState({
    this.bigCount,
    this.name = "BigCounter",
  });

  toJson() {
    return {
      'bigCount': this.bigCount,
      'name': this.name
    };
  }
}

/// Reducers for the store that combined via [combineReducers].
int _bigCounterDecrementReducer(int currentCount, DecrementAction action) {
  return currentCount - (action?.value ?? 100);
}

int _bigCounterIncrementReducer(int currentCount, IncrementAction action) {
  return currentCount + (action?.value ?? 100);
}

final bigCounterActionsReducer = combineReducers<int>([
  TypedReducer<int, IncrementAction>(_bigCounterIncrementReducer),
  TypedReducer<int, DecrementAction>(_bigCounterDecrementReducer),
]);

/// The reducer, composed of the smaller and more specific reducers, that
/// returns the store state.
BigCounterState bigCounterStateReducer(BigCounterState state, action) => BigCounterState(
  bigCount: bigCounterActionsReducer(state.bigCount, action),
);
