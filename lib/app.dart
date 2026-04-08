import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/header.dart';
import 'components/sidebar.dart';
import 'constants/theme.dart';
import 'pages/about.dart';
import 'pages/brands.dart';
import 'pages/categories.dart';
import 'pages/home.dart';
import 'pages/product.dart';

// The main component of your application.
//
// By using multi-page routing, this component will only be built on the server during pre-rendering and
// **not** executed on the client. Instead only the nested [Home] and [About] components will be mounted on the client.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    // This method is rerun every time the component is rebuilt.

    // Renders a <div class="main"> html element with children.
    return div(classes: 'main', [
      const Header(),
      div(classes: 'content', [
        const Sidebar(),
        Router(
          routes: [
            Route(path: '/', title: '首页', builder: (context, state) => const Home()),
            Route(path: '/categories', title: '分类', builder: (context, state) => const Categories()),
            Route(path: '/brands', title: '品牌', builder: (context, state) => const Brands()),
            Route(
              path: '/product/:id',
              title: '商品详情',
              builder: (context, state) => ProductPage(productId: state.params['id']!),
            ),
            Route(path: '/about', title: '关于', builder: (context, state) => const About()),
          ],
        ),
      ]),
    ]);
  }

  // Defines the css styles for elements of this component.
  //
  // By using the @css annotation, these will be rendered automatically to css inside the <head> of your page.
  // Must be a variable or getter of type [List<StyleRule>].
  @css
  static List<StyleRule> get styles => [
    css('.main', [
      css('&').styles(
        display: .flex,
        minHeight: 100.vh,
        flexDirection: .column,
        backgroundColor: backgroundColor,
      ),
      css('.content').styles(
        display: .flex,
        flex: Flex(grow: 1),
      ),
      css('section').styles(
        display: .flex,
        flexDirection: .column,
        justifyContent: .center,
        alignItems: .center,
        flex: Flex(grow: 1),
        padding: .all(2.em),
      ),
      // Responsive design
      css('@media (max-width: 768px)', [
        css('.content').styles(
          flexDirection: .column,
        ),
        css('aside').styles(
          width: 100.percent,
          height: .auto,
        ),
        css('section').styles(
          padding: .all(1.em),
        ),
      ]),
    ]),
  ];
}
