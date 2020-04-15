// Copyright 2020 Workiva Inc.
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

import 'package:redux/redux.dart';

import 'redux_actions.dart';

int initialValue = 0;

int _resetCounterReducer(int currentCount, ResetAction action){
  return initialValue;
}

/////////////////////////////// STORE 1 "Counter" ///////////////////////////////
Store store1 = Store<CounterState>(counterStateReducer, initialState: CounterState(count: initialValue));

class CounterState {
  final int count;
  final String name;
  CounterState({
    this.count,
    this.name = 'Counter',
  });
}

int _counterDecrementReducer(int currentCount, DecrementAction action) {
  return currentCount - (action?.value != null ? action.value : 1);
}

int _counterIncrementReducer(int currentCount, IncrementAction action) {
  return currentCount + (action?.value != null ? action.value : 1);
}

Reducer<int> counterActionsReducer = combineReducers<int>([
  TypedReducer<int, IncrementAction>(_counterIncrementReducer),
  TypedReducer<int, DecrementAction>(_counterDecrementReducer),
  TypedReducer<int, ResetAction>(_resetCounterReducer),
]);

CounterState counterStateReducer(CounterState state, action) => CounterState(
  count: counterActionsReducer(state.count, action),
);

/////////////////////////////// STORE 2 "BigCounter" ///////////////////////////////
Store store2 = Store<BigCounterState>(bigCounterStateReducer, initialState: BigCounterState(bigCount: initialValue));

class BigCounterState {
  final int bigCount;
  final String name;
  BigCounterState({
    this.bigCount,
    this.name = 'BigCounter',
  });
}

int _bigCounterDecrementReducer(int currentCount, DecrementAction action) {
  return currentCount - (action?.value != null ? action.value : 100);
}

int _bigCounterIncrementReducer(int currentCount, IncrementAction action) {
  return currentCount + (action?.value != null ? action.value : 100);
}

Reducer<int> bigCounterActionsReducer = combineReducers<int>([
  TypedReducer<int, IncrementAction>(_bigCounterIncrementReducer),
  TypedReducer<int, DecrementAction>(_bigCounterDecrementReducer),
  TypedReducer<int, ResetAction>(_resetCounterReducer),
]);

BigCounterState bigCounterStateReducer(BigCounterState state, action) => BigCounterState(
  bigCount: bigCounterActionsReducer(state.bigCount, action),
);
