import 'package:flutter/material.dart';
import 'package:keyboard_ui/widget/custom_textfield.dart';
import 'package:keyboard_ui/utils/media_query.dart';
import 'package:keyboard_ui/utils/overlay/keypad_overlay.dart';

import 'enum/keyboard_type.dart';

class NumberInputTwo extends StatefulWidget {
  const NumberInputTwo({Key? key}) : super(key: key);

  @override
  State<NumberInputTwo> createState() => _NumberInputTwoState();
}

class _NumberInputTwoState extends State<NumberInputTwo> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    KeyboardOverlay.addRemoveFocusNode(context, focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Number Input (Type Two)"),
      ),
      body: SizedBox(
        width: deviceWidth(context),
        height: deviceHeight(context),
        child: Column(
          children: [
            const Expanded(
                child: Center(
              child: Text("Click on the 'Done' to remove the keyboard focus"),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
    );
  }
}
