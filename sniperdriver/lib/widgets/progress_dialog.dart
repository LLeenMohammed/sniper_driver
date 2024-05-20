import 'package:flutter/material.dart';
import 'package:sniperdriver/widgets/color.dart';

class ProgressDialog extends StatelessWidget 
{
  final String? msg;
  ProgressDialog({this.msg});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: backgroundColor,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkPurple,
          borderRadius: BorderRadius.circular(6),
        ),
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(
                width: 6.0,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(darkPurple),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                msg!,
                style: const TextStyle(color: darkPurple, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
