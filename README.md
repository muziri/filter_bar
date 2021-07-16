# [filter_bar](https://pub.dev/packages/fliter_bar)

Filter Bar Library for Flutter

## Filter bar like jd

> Supported Platforms
>
> - Android
> - IOS

## How to Use

```yaml
# add this line to your dependencies
filter_bar: ^0.0.1
```

```dart
import 'package:filter_bar/filter_bar.dart';
```

## FilterBar (Android & iOS)

```dart
FilterBar(
        currentIndex: currentIndex,
        reverse: reverse,
        onTap: (index) {
          setState(() {
            print('index=$index currentIndex=$currentIndex reverse=$reverse');
            if (index == currentIndex) {
              reverse = !reverse;
            } else {
              reverse = false;
            }
            print('index=$index currentIndex=$currentIndex reverse=$reverse');
            currentIndex = index;
          });
        },
        items: [
          FilterBarItem(
              label: '综合',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down),
          FilterBarItem(
            label: '销量',
          ),
          FilterBarItem(
              label: '佣金',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down),
          FilterBarItem(
              label: '售价',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down,
              normal: Icons.switch_left),
          FilterBarItem(
              label: '最新',
              up: Icons.arrow_drop_up,
              down: Icons.arrow_drop_down),
          FilterBarItem(
            label: '筛选',
            up: Icons.arrow_drop_up,
            down: Icons.arrow_drop_down,
            imgAssetNormalPath: 'images/flutter.png',
          ),
        ],
      );
```