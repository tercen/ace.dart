library ace.kitchen_sink;

import 'dart:async';
import 'dart:html';
import 'package:ace/ace.dart' as ace;
import 'package:ace/proxy.dart';

part 'src/autocomplete.dart';
part 'src/documents.dart';
part 'src/key_bindings.dart';
part 'src/modes.dart';
part 'src/options.dart';
part 'src/themes.dart';
part 'src/annotator.dart';
part 'src/editor_info.dart';

ace.Editor editor = ace.edit(querySelector('#editor'));
Element controls = querySelector('#controls');

main() {
  ace.implementation = ACE_PROXY_IMPLEMENTATION;
    
  editor
  ..theme = new ace.Theme.named(ace.Theme.CHROME)
  ..session.mode = new ace.Mode.named(ace.Mode.DART)
  ..setValue(DOCUMENT_DART, -1);
  
  enableAutocomplete();
  controls.append(buildDocuments());
  controls.append(buildModes());
  controls.append(buildThemes());
  controls.append(buildKeyBindings());
  controls.append(buildShowInvisibles());
  controls.append(buildShowGutter());
  controls.append(buildShowPrintMargin());
  controls.append(buildUseSoftTabs());
  controls.append(buildAnnotator());
  controls.append(buildTokenClickTracker());
  controls.append(buildDeltaTracker());
}
