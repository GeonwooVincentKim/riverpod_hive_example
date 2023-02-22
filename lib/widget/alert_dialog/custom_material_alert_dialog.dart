import 'package:flutter/material.dart';

class CustomMaterialAlertDialog extends StatelessWidget {
  final bool isAdd;

  const CustomMaterialAlertDialog({
    super.key,
    required this.isAdd
  });

  @override
  Widget build(BuildContext context) {
    // return Dialog(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(16),
    //   ),
    //   child: Scaffold(
    //     appBar: AppBar(
    //       centerTitle: true,
    //       backgroundColor: Colors.blue,
    //       elevation: 0,
    //       leading: IconButton(
    //         icon: Icon(Icons.arrow_back),
    //         onPressed: () => Navigator.pop(context),
    //       ),
    //       title: Text("Hi")
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(24, 20, 24, 8),
    //             child: Text("Contetns")
    //           ),
    //         ],
    //       ),
    //     ),
    //   )
    // );
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.14),
            Text("Hi", textAlign: TextAlign.left,)
          ],
        ),
      ),
      // title:  Text("Hi", textAlign: TextAlign.center,),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       icon: Icon(Icons.arrow_back_ios),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //     ),  
            //     // Text("Title"),
            //   ],
            // ),
            Text("Alert Dialog"),
            Text("Alert Dialog"),

            isAdd ? Text("IsAdd") : Text("IsModify")
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
