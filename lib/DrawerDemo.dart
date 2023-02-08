import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  DrawerDemo({super.key});

  BuildContext? context;

  Function(ItemMenu)? onClickItem;

  ItemMenu? currentMenu;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    onClickItem = (p0) {
      Navigator.pop(context);
      currentMenu = p0;
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          children: _generateDrawerList(),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      currentMenu == null ? 'empty' : currentMenu!.title)));
            },
            child: const Text('Snacked')),
      ),
    );
  }

  List<Widget> _generateDrawerList() {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(const HeaderDrawer());
    List<ItemMenu> items = getItemMenuList();
    var itemViewList = items.map((e) => e.showDivider
        ? ViewItemMenuLast(e, onClickItem)
        : ViewItemMenuBase(
            itemMenu: e,
            onClickItem: onClickItem,
          ));
    widgetList.addAll(itemViewList);
    return widgetList;
  }

  List<ItemMenu> getItemMenuList() {
    var menuList = <ItemMenu>[];
    menuList.add(ItemMenu(Icons.inbox, 'All inboxs', true, ItemType.all));
    menuList.add(ItemMenu(Icons.mail, 'Primary', false, ItemType.primary));
    menuList.add(
        ItemMenu(Icons.social_distance, 'Social', false, ItemType.promotions));
    menuList.add(
        ItemMenu(Icons.ads_click, 'Promotions', true, ItemType.promotions));
    menuList.add(ItemMenu(Icons.star, 'Starred', false, ItemType.starred));
    menuList.add(ItemMenu(Icons.snooze, 'Snoozed', false, ItemType.snoozed));
    menuList.add(ItemMenu(
        Icons.important_devices, 'Important', false, ItemType.important));
    menuList.add(ItemMenu(Icons.send, 'Send', true, ItemType.send));

    menuList.add(ItemMenu(Icons.settings, 'Setting', false, ItemType.setting));
    menuList
        .add(ItemMenu(Icons.feedback, 'Send feedback', false, ItemType.send));
    menuList.add(ItemMenu(Icons.help, 'Help', false, ItemType.help));

    return menuList;
  }
}

class ViewItemMenuLast extends ViewItemMenuBase {
  ViewItemMenuLast(ItemMenu menu, Function(ItemMenu)? onClickItem, {super.key})
      : super(itemMenu: menu, onClickItem: onClickItem);

  @override
  Widget build(BuildContext context) {
    Widget parent = super.build(context);
    return Column(
      children: [
        parent,
        Container(
          margin: const EdgeInsets.only(left: 70),
          child: const Divider(
            color: Colors.grey,
            height: 1,
          ),
        )
      ],
    );
  }
}

class ViewItemMenuBase extends StatelessWidget {
  ViewItemMenuBase(
      {required this.itemMenu, required this.onClickItem, super.key});

  ItemMenu itemMenu;
  Function(ItemMenu)? onClickItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(itemMenu.icon),
      title: Text(itemMenu.title),
      onTap: () {
        onClickItem?.call(itemMenu);
      },
    );
  }
}

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'images/gmail.png',
                  width: 34,
                  height: 34,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Gmail',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(16),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class ItemMenu {
  ItemMenu(this.icon, this.title, this.showDivider, this.type);

  IconData icon;
  String title;
  bool showDivider;
  ItemType type;
}

enum ItemType {
  all,
  primary,
  social,
  promotions,
  starred,
  snoozed,
  important,
  send,
  setting,
  feedback,
  help;
}
