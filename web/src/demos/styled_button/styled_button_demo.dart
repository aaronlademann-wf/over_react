import 'package:over_react/over_react.dart';

import '../../demo_components.dart';

ReactElement styledButtonDemo() =>
  (Dom.div()..className = 'btn-toolbar')(
    StyledButton()('Primary'),
    (StyledButton()..skin = ButtonSkin.SECONDARY)('Secondary'),
    (StyledButton()..skin = ButtonSkin.SUCCESS)('Success'),
    (StyledButton()..skin = ButtonSkin.INFO)('Info'),
    (StyledButton()..skin = ButtonSkin.WARNING)('Warning'),
    (StyledButton()..skin = ButtonSkin.DANGER)('Danger'),
    (StyledButton()..skin = ButtonSkin.LINK)('Link'),
  );
