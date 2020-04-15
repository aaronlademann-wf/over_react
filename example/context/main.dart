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

import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:over_react/components.dart' as v2;
import 'package:react/react_client.dart';
import 'package:react/react_dom.dart' as react_dom;
import './components/my_provider_component.dart';
import './components/my_context_component.dart';
import './context.dart';

main() {
  setClientConfiguration();

  react_dom.render(
    v2.ErrorBoundary()(
      MyProvider()(
        someContext.Consumer()(
          (value){
            return Dom.div()('$value');
          },
        ),
      ),
      MyContext()(),
    ), querySelector('#content')
  );
}
