import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/counter.dart';
import '../components/product_card.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class Home extends StatefulComponent {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Run code depending on the rendering environment.
    if (kIsWeb) {
      print("Hello client");
      // When using @client components there is no default `main()` function on the client where you would normally
      // run any client-side initialization logic. Instead you can put it here, considering this component is only
      // mounted once at the root of your client-side component tree.
    } else {
      print("Hello server");
    }
  }

  @override
  Component build(BuildContext context) {
    // Sample product data
    final products = [
      const ProductCard(
        id: '1',
        title: '时尚连衣裙',
        imageUrl: 'https://via.placeholder.com/300x200?text=Dress',
        price: '199',
        originalPrice: '299',
        rating: 4,
      ),
      const ProductCard(
        id: '2',
        title: '运动鞋',
        imageUrl: 'https://via.placeholder.com/300x200?text=Shoes',
        price: '399',
        originalPrice: '499',
        rating: 5,
      ),
      const ProductCard(
        id: '3',
        title: '智能手表',
        imageUrl: 'https://via.placeholder.com/300x200?text=Watch',
        price: '1299',
        originalPrice: '1599',
        rating: 4,
      ),
      const ProductCard(
        id: '4',
        title: '笔记本电脑',
        imageUrl: 'https://via.placeholder.com/300x200?text=Laptop',
        price: '5999',
        originalPrice: '6999',
        rating: 5,
      ),
      const ProductCard(
        id: '5',
        title: '咖啡杯',
        imageUrl: 'https://via.placeholder.com/300x200?text=Cup',
        price: '29',
        originalPrice: '39',
        rating: 3,
      ),
      const ProductCard(
        id: '6',
        title: '耳机',
        imageUrl: 'https://via.placeholder.com/300x200?text=Headphones',
        price: '299',
        originalPrice: '399',
        rating: 4,
      ),
    ];

    return section([
      h1([.text('热门商品')]),
      div(classes: 'product-grid', [
        for (var product in products) product,
      ]),
      div(styles: Styles(height: 100.px), []),
      const Counter(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.product-grid', [
      css('&').styles(
        display: .grid,
        padding: .all(2.em),
      ),
    ]),
  ];
}
