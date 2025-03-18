import '../models/string_details.dart';
import 'spoiler_paragraph.dart';
import 'package:flutter/rendering.dart'
    show DiagnosticPropertiesBuilder, DiagnosticsProperty, TextSelection;
import 'package:flutter/widgets.dart'
    show BuildContext, Directionality, RichText, ValueSetter;

class SpoilerRichText extends RichText {
  SpoilerRichText({
    required this.onBoundariesCalculated,
    required this.initialized,
    required super.text,
    this.onPaint,
    this.selection,
    super.key,
  });

  final bool initialized;
  final ValueSetter<StringDetails> onBoundariesCalculated;
  final PaintCallback? onPaint;
  final TextSelection? selection;

  @override
  SpoilerParagraph createRenderObject(BuildContext context) {
    return SpoilerParagraph(
      text,
      onPaint: onPaint,
      selection: selection,
      onBoundariesCalculated: onBoundariesCalculated,
      initialized: initialized,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('initialized', initialized))
      ..add(
        DiagnosticsProperty<ValueSetter<StringDetails>>(
          'onBoundariesCalculated',
          onBoundariesCalculated,
        ),
      )
      ..add(DiagnosticsProperty<PaintCallback?>('onPaint', onPaint));
  }
}
