import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

@client
class Sidebar extends StatelessComponent {
  const Sidebar({super.key});

  @override
  Component build(BuildContext context) {
    var activePath = context.url;

    return aside(classes: 'sidebar', [
      ul([
        for (var item in [
          (label: '首页', path: '/', icon: '🏠'),
          (label: '分类', path: '/categories', icon: '📂'),
          (label: '品牌', path: '/brands', icon: '🏷️'),
          (label: '关于', path: '/about', icon: 'ℹ️'),
        ])
          li(classes: activePath == item.path ? 'active' : null, [
            Link(to: item.path, child: span([.text('${item.icon} ${item.label}')])),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.sidebar', [
      css('&').styles(
        width: 200.px,
        backgroundColor: const Color('#f5f5f5'),
        padding: .all(1.em),
        border: Border.all(color: const Color('#ddd'), width: 1.px),
      ),
      css('ul').styles(
        listStyle: .none,
        padding: .unset,
        margin: .unset,
      ),
      css('li').styles(
        margin: .only(bottom: 0.5.em),
      ),
      css('a').styles(
        display: .block,
        padding: .symmetric(horizontal: 1.em, vertical: 0.5.em),
        color: Colors.black,
        textDecoration: TextDecoration(line: .none),
        radius: .all(.circular(4.px)),
      ),
      css('a:hover').styles(
        backgroundColor: const Color('#e0e0e0'),
      ),
      css('li.active a').styles(
        backgroundColor: primaryColor,
        color: Colors.white,
      ),
    ]),
  ];
}
