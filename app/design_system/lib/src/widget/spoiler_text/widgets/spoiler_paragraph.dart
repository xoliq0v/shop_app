import '../models/string_details.dart';
import 'package:flutter/rendering.dart';

typedef PaintCallback = void Function(
  PaintingContext context,
  Offset offset,
  void Function(PaintingContext context, Offset offset) superPaint,
);

class SpoilerParagraph extends RenderParagraph {
  SpoilerParagraph(
    super.text, {
    required super.textDirection,
    required this.onBoundariesCalculated,
    required this.initialized,
    this.onPaint,
    this.selection,
  });

  final bool initialized;
  final ValueSetter<StringDetails> onBoundariesCalculated;
  final PaintCallback? onPaint;
  final TextSelection? selection;

  /// Get list of words bounding boxes
  List<Word> getWords() {
    final text = this.text;
    final textPainter = TextPainter(
      text: text,
      textDirection: textDirection,
      textAlign: textAlign,
      // textScaler: textScaler ,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
    );
    textPainter.layout(
      minWidth: constraints.minWidth,
      maxWidth: constraints.maxWidth,
    );

    // Get all text runs from text
    final textRuns = <Word>[];

    void getAllWordBoundaries(int offset, List<Word> list) {
      final range = textPainter.getWordBoundary(TextPosition(offset: offset));

      if (range.isCollapsed) return;

      final substr = text.toPlainText().substring(range.start, range.end);

      /// Move to next word if current word is empty
      if (substr.trim().isEmpty) {
        getAllWordBoundaries(range.end, list);
        return;
      }

      // Get paragraph position
      final pos = textPainter.getBoxesForSelection(
          TextSelection(baseOffset: range.start, extentOffset: range.end));

      if (pos.isNotEmpty) {
        textRuns.add(Word(
          word: substr,
          rect: pos.first.toRect(),
          range: range,
        ));
      }

      getAllWordBoundaries(range.end, list);
    }

    if (selection != null) {
      final boxes = textPainter.getBoxesForSelection(selection!);

      for (final box in boxes) {
        textRuns.add(
          Word(
            word: text.toPlainText().substring(
                  selection!.start,
                  selection!.end,
                ),
            rect: box.toRect(),
            range: TextRange(start: selection!.start, end: selection!.end),
          ),
        );
      }
    } else {
      getAllWordBoundaries(0, textRuns);
    }
    return textRuns;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (!initialized) {
      final bounds = getWords();

      onBoundariesCalculated(StringDetails(words: bounds));
    }

    onPaint?.call(context, offset, super.paint);
  }
}
