/* Developed by Eng Mouaz M AlShahmeh */
import 'package:flutter/material.dart';

InputDecoration textInputDecoration(BuildContext context) => InputDecoration(
  labelStyle: Theme.of(context).textTheme.labelSmall,
  errorStyle: Theme.of(context).textTheme.labelSmall,
  hintText: '',
  hintStyle: Theme.of(context).textTheme.labelSmall,
  fillColor: Theme.of(context).colorScheme.background,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.background,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.primary,
      width: 1.0,
    ),
  ),
);

ButtonStyle buttonSubmit(BuildContext context) => ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      )),
  foregroundColor:
  MaterialStateProperty.all(Theme.of(context).colorScheme.background),
  backgroundColor:
  MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
  textStyle: MaterialStateProperty.all(
    TextStyle(
      fontSize: 16,
      color: Theme.of(context).colorScheme.background,
    ),
  ),
);