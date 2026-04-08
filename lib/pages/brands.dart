import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class Brands extends StatelessComponent {
  const Brands({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      h1([.text('品牌专区')]),
      p([.text('探索各大品牌的优质商品。')]),
      // TODO: Add brand list
    ]);
  }
}
