extension NumberFormatting on double {
  String get formattedWithSpaces {
    final parts = toString().split('.');
    parts[0] = parts[0].replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]} ');
    return parts.length > 1 ? '${parts[0]}.${parts[1]}' : parts[0];
  }

  String get formatCompact {
    if (this >= 1e9) {
      return '${(this / 1e9).toStringAsFixed(1)}B'.replaceAll('.0', '');
    } else if (this >= 1e6) {
      return '${(this / 1e6).toStringAsFixed(1)}M'.replaceAll('.0', '');
    } else if (this >= 1e3) {
      return '${(this / 1e3).toStringAsFixed(1)}K'.replaceAll('.0', '');
    } else {
      return toString();
    }
  }
}
