import 'dart:ui';

import 'package:aliftech_task/data/localization/locale_keys.g.dart';
import 'package:aliftech_task/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BlurryDialog extends StatefulWidget {
  BlurryDialog(this.dateTime, this.content, this.continueCallBack);

  String content;
  String date = "due date";
  Function(String content, DateTime dateTime) continueCallBack;
  DateTime dateTime;

  @override
  _BlurryDialogState createState() => _BlurryDialogState();
}

class _BlurryDialogState extends State<BlurryDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          title: TextField(
            controller: TextEditingController()..text = widget.content,
          ),
          content: InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: AppWidgets.textLocale(localeKey: widget.date, textAlign: TextAlign.center)),
          actions: <Widget>[
            TextButton(
              child: AppWidgets.textLocale(localeKey: LocaleKeys.cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // : Container(),
            TextButton(
              child: AppWidgets.textLocale(localeKey: LocaleKeys.add),
              onPressed: () {
                widget.continueCallBack(widget.content, widget.dateTime);
              },
            ),
          ],
        ));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: widget.dateTime, initialDatePickerMode: DatePickerMode.day, firstDate: DateTime(2015), lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        widget.dateTime = picked;
        widget.date = DateFormat.yMd().format(widget.dateTime);
      });
    }
  }
}
