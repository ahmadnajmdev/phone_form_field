import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import 'country_selector/country.dart';

class CountryCodeChip extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool showDialCode;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final double flagSize;
  final TextDirection? textDirection;
  final bool showIsoCode;
  final bool enabled;

  CountryCodeChip({
    super.key,
    required IsoCode isoCode,
    this.textStyle = const TextStyle(),
    this.showFlag = true,
    this.showDialCode = true,
    this.padding = const EdgeInsets.all(20),
    this.flagSize = 20,
    this.textDirection,
    this.showIsoCode = false,
    this.enabled = true,
  }) : country = Country(isoCode, '');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (showIsoCode) ...[
          Text(
            country.isoCode.name,
            style: textStyle.copyWith(
              color: enabled ? null : Theme.of(context).disabledColor,
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (showFlag) ...[
          CircleFlag(
            country.isoCode.name,
            size: flagSize,
          ),
          const SizedBox(width: 8),
        ],
        if (showDialCode)
          Text(
            country.displayCountryCode,
            style: textStyle.copyWith(
              color: enabled ? null : Theme.of(context).disabledColor,
            ),
            textDirection: textDirection,
          ),
      ],
    );
  }
}
