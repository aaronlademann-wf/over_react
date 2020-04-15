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

part of over_react.component_declaration.component2.flux_component_test;

@Factory()
UiFactory<TestStatefulPropValidationProps> TestStatefulPropValidation = _$TestStatefulPropValidation;

@Props()
class _$TestStatefulPropValidationProps extends FluxUiProps implements TestPropValidationProps {
  @override
  @requiredProp
  String required;
}

@State()
class _$TestStatefulPropValidationState extends UiState {}

@Component2()
class TestStatefulPropValidationComponent extends FluxUiStatefulComponent2<TestStatefulPropValidationProps, TestStatefulPropValidationState> {
  @override
  render() => Dom.div()();
}
