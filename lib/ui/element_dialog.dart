import 'package:flutter/material.dart';

Future<M?> showTextDialogAndGetResult<M>({
  required BuildContext context,
  required String title,
  required String? content,
  required Map<String, M Function()> actionTitleAndActions,
}) async {
  final List<Widget> actions = <Widget>[];
  M? returnValue;
  actionTitleAndActions.forEach((label, action) {
    actions.add(TextButton(
      onPressed: () {
        Navigator.pop(context);
        returnValue = action();
      },
      child: Text(label),
    ));
  });
  await showDialog(
      context: context,
      builder: (context) => content == null
          ? SimpleDialog(title: Text(title), children: actions)
          : AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: actions,
            ));
  return returnValue;
}

Future<M?> showDialogAndGetResult<M>({
  required BuildContext context,
  required String title,
  required Widget? content,
  required Map<String, M Function()> actionTitleAndActions,
}) async {
  final List<Widget> actions = <Widget>[];
  M? returnValue;
  actionTitleAndActions.forEach((label, action) {
    actions.add(TextButton(
      onPressed: () {
        Navigator.pop(context);
        returnValue = action();
      },
      child: Text(label),
    ));
  });
  await showDialog(
      context: context,
      builder: (context) => content == null
          ? SimpleDialog(title: Text(title), children: actions)
          : AlertDialog(
        title: Text(title),
        content: content,
        actions: actions,
      ));
  return returnValue;
}



Future<M?> showItemListAndGetItemDialog<M>({
  required BuildContext context,
  required String title,
  required List<M> itemList,
}) async {
  late final M? selectedItem;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: SizedBox(
        height: 200,
        width: 100,
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            final M item = itemList[index];
            return Center(
              child: TextButton(
                onPressed: () {
                  selectedItem = item;
                  Navigator.pop(context);
                },
                child: Text(item.toString()),
              ),
            );
          },
        ),
      ),
    ),
  );
  return selectedItem;
}

// Future<bool?> showTakeOutOrDeleteTrashDialog({
//   required BuildContext context,
// }) async {
//   bool? isTakeOut;
//   await showDialog(
//       context: context,
//       builder: (context) => SimpleDialog(
//             title: const Text('Take Out?'),
//             children: [
//               TextButton(
//                 onPressed: () {
//                   isTakeOut = false;
//                   Navigator.pop(context);
//                 },
//                 child: const Text('delete'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   isTakeOut = true;
//                   Navigator.pop(context);
//                 },
//                 child: const Text('take out'),
//               ),
//             ],
//           ));
//   return isTakeOut;
// }
