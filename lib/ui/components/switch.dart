import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Switch extends StatelessWidget {
  final ValueChanged<bool> onChanged;
  final bool value;

  Switch({@required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: onChanged == null,
      child: CupertinoSwitch(
        activeColor: Theme.of(context).primaryColorDark,
        onChanged: onChanged ?? (_) {},
        value: value,
      ),
    );
  }
}
