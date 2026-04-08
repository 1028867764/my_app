import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

@client
class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    var activePath = context.url;

    return header([
      div(classes: 'header-container', [
        // Logo
        div(classes: 'logo', [
          img(src: 'images/logo.svg', width: 80),
        ]),
        // Navigation
        nav([
          for (var route in [
            (label: '首页', path: '/'),
            (label: '分类', path: '/categories'),
            (label: '品牌', path: '/brands'),
            (label: '关于', path: '/about'),
          ])
            div(classes: activePath == route.path ? 'active' : null, [
              Link(to: route.path, child: .text(route.label)),
            ]),
        ]),
        // Search bar
        div(classes: 'search-bar', [
          input(type: InputType.text, attributes: {'placeholder': '搜索商品...'}, classes: 'search-input'),
          button(classes: 'search-btn', [.text('搜索')]),
        ]),
        // User menu
        div(classes: 'user-menu', [
          button(classes: 'login-btn', [.text('登录')]),
          // Placeholder for user avatar if logged in
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header', [
      css('&').styles(
        backgroundColor: primaryColor,
        color: Colors.white,
        padding: .symmetric(horizontal: 1.em, vertical: 0.5.em),
      ),
      css('.header-container').styles(
        display: .flex,
        alignItems: .center,
        justifyContent: .spaceBetween,
        maxWidth: 1200.px,
        margin: .symmetric(horizontal: .auto),
        padding: .symmetric(horizontal: 1.em),
      ),
      css('.logo').styles(
        flex: Flex(shrink: 0),
      ),
      css('nav', [
        css('&').styles(
          display: .flex,
        ),
        css('a', [
          css('&').styles(
            color: Colors.white,
            textDecoration: TextDecoration(line: .none),
            padding: .symmetric(horizontal: 1.em, vertical: 0.5.em),
            radius: .all(.circular(4.px)),
          ),
          css('&:hover').styles(
            backgroundColor: const Color('#0005'),
          ),
        ]),
        css('div.active a').styles(
          backgroundColor: const Color('#0005'),
          fontWeight: .bold,
        ),
      ]),
      css('.search-bar').styles(
        display: .flex,
        alignItems: .center,
        backgroundColor: Colors.white,
        radius: .all(.circular(20.px)),
        overflow: .hidden,
        flex: Flex(grow: 1, shrink: 1),
        maxWidth: 400.px,
        margin: .symmetric(horizontal: 2.em),
      ),
      css('.search-input').styles(
        flex: Flex(grow: 1),
        border: .none,
        padding: .symmetric(horizontal: 1.em, vertical: 0.5.em),
      ),
      css('.search-btn').styles(
        backgroundColor: primaryColor,
        color: Colors.white,
        border: .none,
        padding: .symmetric(horizontal: 1.em, vertical: 0.5.em),
        cursor: .pointer,
      ),
      css('.user-menu').styles(
        display: .flex,
        alignItems: .center,
      ),
      css('.login-btn').styles(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1.px),
        padding: .symmetric(horizontal: 1.em, vertical: 0.5.em),
        radius: .all(.circular(4.px)),
        cursor: .pointer,
      ),
      // Responsive
      css('@media (max-width: 768px)', [
        css('.header-container').styles(
          flexDirection: .column,
        ),
        css('nav').styles(
          order: 2,
          width: 100.percent,
          justifyContent: .center,
        ),
        css('.search-bar').styles(
          order: 1,
          maxWidth: .unset,
          margin: .unset,
        ),
        css('.user-menu').styles(
          order: 3,
        ),
      ]),
    ]),
  ];
}
