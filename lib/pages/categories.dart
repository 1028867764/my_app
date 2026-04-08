import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class Categories extends StatelessComponent {
  const Categories({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      h1([.text('商品分类')]),
      p([.text('浏览不同类别的商品。')]),
      // TODO: Add category list
    ]);
  }
}
