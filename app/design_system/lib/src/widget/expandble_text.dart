import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxWords;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxWords = 10,
  });

  @override
  State<ExpandableText> createState() => _ExpandableCommentState();
}

class _ExpandableCommentState extends State<ExpandableText> {
  bool isExpanded = false;

  String get truncatedText {
    final words = widget.text.split(' ');
    if (words.length <= widget.maxWords) return widget.text;
    return '${words.take(widget.maxWords).join(' ')}...';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  isExpanded ? widget.text : truncatedText,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          if (widget.text.split(' ').length > widget.maxWords)
            GestureDetector(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  isExpanded ? 'Show less' : 'Show more',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}