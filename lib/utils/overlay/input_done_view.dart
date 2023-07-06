import 'package:flutter/cupertino.dart';

class InputDoneView extends StatelessWidget {
  const InputDoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 42,
        color: const Color(0xffD1D3D9),
        child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
              child: CupertinoButton(
                padding:
                    const EdgeInsets.only(right: 24.0, top: 8.0, bottom: 8.0),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: const Text("Done",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff000B23))),
              ),
            )));

    // return Align(
    //     alignment: Alignment.topRight,
    //     child: Container(
    //       width: 80.w,
    //       height: 30.h,
    //       alignment: Alignment.center,
    //       margin: EdgeInsets.only(top: 0.0, bottom: 3.0, right: 3.w, left: 3.w),
    //       decoration: BoxDecoration(
    //           color: CupertinoColors.extraLightBackgroundGray,
    //           borderRadius: BorderRadius.circular(12.r)),
    //       child: InkWell(
    //         onTap: () {
    //           FocusScope.of(context).requestFocus(FocusNode());
    //         },
    //         child: Text("Done",
    //             style: TextStyle(
    //                 color: AppColor.brandBlack.withOpacity(0.7),
    //                 fontSize: 13.sp,
    //                 fontWeight: FontWeight.w600)),
    //       ),
    //     ));
  }
}
