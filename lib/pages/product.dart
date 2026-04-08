import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

@client
class ProductPage extends StatelessComponent {
  final String productId;

  const ProductPage({super.key, required this.productId});

  @override
  Component build(BuildContext context) {
    // In a real app, you'd fetch product data based on productId
    return section(classes: 'product-page', [
      div(classes: 'product-gallery', [
        img(src: 'https://via.placeholder.com/400x400?text=Product+$productId', classes: 'main-image'),
        div(classes: 'thumbnail-list', [
          for (int i = 1; i <= 4; i++)
            img(src: 'https://via.placeholder.com/80x80?text=Thumb+$i', classes: 'thumbnail'),
        ]),
      ]),
      div(classes: 'product-details', [
        h1([.text('商品名称 - $productId')]),
        div(classes: 'rating', [
          for (int i = 0; i < 5; i++) span(classes: i < 4 ? 'star filled' : 'star', [.text('★')]),
          span([.text(' (128 评价)')]),
        ]),
        div(classes: 'price-section', [
          span(classes: 'current-price', [.text('¥299')]),
          span(classes: 'original-price', [.text('¥399')]),
          span(classes: 'discount', [.text('7.5折')]),
        ]),
        div(classes: 'product-description', [
          h3([.text('商品描述')]),
          p([.text('这是商品的详细描述。优质材料，精湛工艺，让您物超所值。')]),
        ]),
        div(classes: 'purchase-section', [
          div(classes: 'quantity-selector', [
            button(classes: 'qty-btn', [.text('-')]),
            input(type: InputType.number, attributes: {'value': '1', 'min': '1'}, classes: 'qty-input'),
            button(classes: 'qty-btn', [.text('+')]),
          ]),
          button(classes: 'add-to-cart-large', [.text('加入购物车')]),
          button(classes: 'buy-now', [.text('立即购买')]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.product-page', [
      css('&').styles(
        display: .flex,
        maxWidth: 1200.px,
        margin: .symmetric(horizontal: .auto),
        padding: .all(2.em),
      ),
      css('.product-gallery').styles(
        flex: Flex(basis: 50.percent),
      ),
      css('.main-image').styles(
        width: 100.percent,
        height: .auto,
        radius: .all(.circular(8.px)),
      ),
      css('.thumbnail-list').styles(
        display: .flex,
      ),
      css('.thumbnail').styles(
        width: 80.px,
        height: 80.px,
        radius: .all(.circular(4.px)),
        cursor: .pointer,
        border: Border.all(color: const Color('#ddd'), width: 2.px),
      ),
      css('.thumbnail:hover').styles(
        border: Border.all(color: primaryColor, width: 2.px),
      ),
      css('.product-details').styles(
        flex: Flex(basis: 50.percent),
      ),
      css('h1').styles(
        color: Colors.black,
      ),
      css('.rating').styles(
        display: .flex,
        alignItems: .center,
      ),
      css('.current-price').styles(
        fontSize: 2.em,
        fontWeight: .bold,
        color: const Color('#e74c3c'),
      ),
      css('.original-price').styles(
        color: const Color('#999'),
        textDecoration: TextDecoration(line: .lineThrough),
      ),
      css('.discount').styles(
        backgroundColor: const Color('#e74c3c'),
        color: Colors.white,
        padding: .symmetric(horizontal: 0.5.em, vertical: 0.25.em),
        radius: .all(.circular(4.px)),
        fontSize: 0.8.em,
      ),
      css('.product-description').styles(),
      css('.product-description h3').styles(),
      css('.purchase-section').styles(
        display: .flex,
        alignItems: .center,
      ),
      css('.quantity-selector').styles(
        display: .flex,
        alignItems: .center,
        border: Border.all(color: const Color('#ddd'), width: 1.px),
        radius: .all(.circular(4.px)),
      ),
      css('.qty-btn').styles(
        backgroundColor: Colors.transparent,
        border: .none,
        width: 2.em,
        height: 2.em,
        cursor: .pointer,
        fontSize: 1.2.em,
      ),
      css('.qty-input').styles(
        width: 3.em,
        textAlign: .center,
        border: .none,
      ),
      css('.add-to-cart-large').styles(
        backgroundColor: primaryColor,
        color: Colors.white,
        border: .none,
        padding: .symmetric(horizontal: 2.em, vertical: 0.75.em),
        radius: .all(.circular(4.px)),
        cursor: .pointer,
        fontSize: 1.em,
      ),
      css('.buy-now').styles(
        backgroundColor: const Color('#e74c3c'),
        color: Colors.white,
        border: .none,
        padding: .symmetric(horizontal: 2.em, vertical: 0.75.em),
        radius: .all(.circular(4.px)),
        cursor: .pointer,
        fontSize: 1.em,
      ),
      // Responsive
      css('@media (max-width: 768px)', [
        css('.product-page').styles(
          flexDirection: .column,
        ),
        css('.product-gallery').styles(
          flex: .unset,
        ),
        css('.product-details').styles(
          flex: .unset,
        ),
      ]),
    ]),
  ];
}
