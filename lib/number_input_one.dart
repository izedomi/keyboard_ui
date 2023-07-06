import 'package:flutter/material.dart';
import 'package:keyboard_ui/widget/custom_textfield.dart';
import 'package:keyboard_ui/enum/keyboard_type.dart';
import 'package:keyboard_ui/utils/media_query.dart';

class NumberInputOne extends StatefulWidget {
  const NumberInputOne({Key? key}) : super(key: key);

  @override
  State<NumberInputOne> createState() => _NumberInputOneState();
}

class _NumberInputOneState extends State<NumberInputOne> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Number Input (Type One)"),
        ),
        body: Container(
          width: deviceWidth(context),
          height: deviceHeight(context),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                  child: Center(
                child: Text(
                    "Click any area of the screen to remove keyboard focus"),
              )),
              Expanded(
                child: Center(
                  child: CustomTextField(
                    labelText: "Enter Phone Number",
                    controller: controller,
                    keyboardType: KeyboardType.number,
                    focusNode: focusNode,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
