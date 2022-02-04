import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui_tool/utils/tost_util.dart';
import 'package:flutter_ui_tool/widgets/sl_app_bar_widget.dart';
class SlidablePage extends StatefulWidget {

  const SlidablePage({Key? key}) : super(key: key);

  @override
  _SlidablePageState createState() => _SlidablePageState();
}

class _SlidablePageState extends State<SlidablePage> {
  List<String> items = new List<String>.generate(30, (i) => "Item ${(i + 1)}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SLAppBarWidget(title:'左右编辑'),
      body: ListView.builder(
        itemBuilder: (context,int index) {
          // final item = items[index];
          return Slidable(
            // Specify a key if the Slidable is dismissible.
            key:  ValueKey(index),

            // The start action pane is the one at the left or the top side.
            startActionPane: ActionPane(
              // A motion is a widget used to control how the pane animates.
              motion: const ScrollMotion(),

              // A pane can dismiss the Slidable.
              dismissible: DismissiblePane(onDismissed: () {}),

              // All actions are defined in the children parameter.
              children: const [
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),

            // The end action pane is the one at the right or the bottom side.
            endActionPane: const ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 1,
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Archive',
                ),
                SlidableAction(
                  onPressed: doNothing,
                  backgroundColor: Color(0xFF0392CF),
                  foregroundColor: Colors.white,
                  icon: Icons.save,
                  label: 'Save',
                ),
              ],
            ),

            // The child of the Slidable is what the user sees when the
            // component is not dragged.
            child:  ListTile(title: Text('item'+' $index'+'–––Slide me',textAlign: TextAlign.center)),
          );
        },
        itemCount: items.length,
      ),
    );
  }

}
void doNothing(BuildContext context) {
     TostUtil.showToast('点击了');
}