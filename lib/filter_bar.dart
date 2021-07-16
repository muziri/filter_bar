import 'package:flutter/material.dart';

///自定义筛选Widget
class FilterBar extends StatefulWidget {
  FilterBar({
    Key? key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.reverse = false,
    this.selectedItemColor,
    this.unselectedItemColor,
  })  : assert(items != null),
        assert(0 <= currentIndex && currentIndex < items.length),
        super(key: key);

  ///筛选项
  final List<FilterBarItem> items;

  ///点击事件
  final ValueChanged<int>? onTap;

  ///当前位置
  final int currentIndex;

  ///是否反向
  final bool reverse;

  ///选中颜色
  final Color? selectedItemColor;

  ///未选中颜色
  final Color? unselectedItemColor;

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _createTiles(),
    );
  }

  List<_FilterBarTile> _createTiles() {
    List<_FilterBarTile> tiles = [];
    for (int i = 0; i < widget.items.length; i++) {
      tiles.add(_FilterBarTile(
        item: widget.items[i],
        selectedItemColor: widget.selectedItemColor ?? Colors.black,
        unselectedItemColor: widget.unselectedItemColor ?? Colors.grey,
        onTap: () {
          widget.onTap?.call(i);
        },
        selected: i == widget.currentIndex,
        reverse: widget.reverse,
      ));
    }
    return tiles;
  }
}

class _FilterBarTile extends StatelessWidget {
  const _FilterBarTile({
    Key? key,
    required this.item,
    this.selected = false,
    this.reverse = false,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    this.onTap,
  }) : super(key: key);
  final FilterBarItem item;
  final bool selected;
  final bool reverse;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget result = InkResponse(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: item.label,
            style: TextStyle(
                color: selected ? selectedItemColor : unselectedItemColor,
                fontSize: item.fontSize),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: selected
                ? ((item.up == null || item.down == null) &&
                (item.imgAssetUpPath == null ||
                    item.imgAssetDownPath == null))
                ? Container(
              width: item.iconSize,
            )
                : item.up != null
                ? Icon(
              reverse ? item.up : item.down,
              color: selectedItemColor,
              size: item.iconSize,
            )
                : Image.asset(
              reverse
                  ? item.imgAssetUpPath!
                  : item.imgAssetDownPath!,
              width: item.imgWidth,
              height: item.imgHeight,
            )
                : (item.normal == null && item.imgAssetNormalPath == null
                ? Container(
              width: item.iconSize,
            )
                : item.normal != null
                ? Icon(
              item.normal,
              color: unselectedItemColor,
              size: item.iconSize,
            )
                : Image.asset(
              item.imgAssetNormalPath!,
              width: item.imgWidth,
              height: item.imgHeight,
            )),
          ),
        ]),
      ),
    );

    return result;
  }
}

///筛选Item,IconData优先级高于Image
class FilterBarItem {
  final String label; //筛选文字
  final double fontSize; //字体大小
  final IconData? up; //向上
  final IconData? down; //向下
  final IconData? normal; //未选中
  final double iconSize; //icon大小默认为12
  final String? imgAssetUpPath; //图片方式 向上
  final String? imgAssetDownPath; //图片方式 向下
  final String? imgAssetNormalPath; //图片方式 未选中
  final double? imgWidth; //图片方式 宽度
  final double? imgHeight; //图片方式 高度

  const FilterBarItem({
    required this.label,
    this.fontSize = 12,
    this.up,
    this.down,
    this.normal,
    this.iconSize = 20,
    this.imgAssetUpPath,
    this.imgAssetDownPath,
    this.imgAssetNormalPath,
    this.imgWidth = 20,
    this.imgHeight = 20,
  });
}
