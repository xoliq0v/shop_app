import 'package:flutter/material.dart';

class EcoDropdownMenu extends StatefulWidget {
  final List<String>? items;
  final bool isLoading;
  final String? initialSelection;
  final Function(String?)? onChanged;
  final Function()? onAddCustomer;
  final String? topText;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final String? placeholderText; // New placeholder text parameter

  const EcoDropdownMenu({
    super.key,
    this.items,
    this.isLoading = false,
    this.initialSelection,
    this.onChanged,
    this.onAddCustomer,
    this.topText,
    this.padding,
    this.width,
    this.placeholderText, // Added placeholder parameter
  });

  @override
  _EcoDropdownMenuState createState() => _EcoDropdownMenuState();
}

class _EcoDropdownMenuState extends State<EcoDropdownMenu> {
  List<DropdownMenuEntry<String>> _dropdownEntries = [];
  String? _selectedValue;

  @override
  void didUpdateWidget(covariant EcoDropdownMenu oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update dropdown entries when items change
    if (widget.items != oldWidget.items) {
      _updateDropdownEntries();
    }

    // Update selected value if initialSelection changes
    if (widget.initialSelection != oldWidget.initialSelection) {
      setState(() {
        _selectedValue = widget.initialSelection;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _updateDropdownEntries();
    // Set initial selection
    _selectedValue = widget.initialSelection;
  }

  void _updateDropdownEntries() {
    // Convert items to dropdown entries if available
    if (widget.items != null) {
      _dropdownEntries = widget.items!.map((item) =>
          DropdownMenuEntry<String>(value: item, label: item)
      ).toList();
    } else {
      _dropdownEntries = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.topText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                widget.topText!,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          DropdownMenu<String>(
            initialSelection: _selectedValue,
            width: widget.width ?? MediaQuery.sizeOf(context).width * 0.9,
            enabled: widget.onChanged != null,
            hintText: widget.placeholderText, // Add placeholder text
            onSelected: (String? selected) {
              // If no selection is made or onChanged is null, do nothing
              if (selected == null || widget.onChanged == null) return;

              // Update local state
              setState(() {
                _selectedValue = selected;
              });

              // Call onChanged callback
              widget.onChanged!(selected);
            },
            leadingIcon: widget.onAddCustomer != null ? IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: widget.onAddCustomer,
            ) : null,
            dropdownMenuEntries: [
              // Show loading indicator if isLoading is true
              if (widget.isLoading)
                DropdownMenuEntry(
                    value: 'loading',
                    label: 'Loading...',
                    enabled: false,
                    leadingIcon: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator.adaptive(
                          strokeWidth: 2,
                        )
                    )
                )
              // Otherwise, show the actual items
              else
                ..._dropdownEntries,
            ],
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(colorScheme.surface),
            ),
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: colorScheme.surface,
                        width: 2
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: colorScheme.surface,
                        width: 2
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: colorScheme.secondary,
                        width: 2
                    )
                ),
                fillColor: colorScheme.surface
            ),
          )
        ],
      ),
    );
  }
}