import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../constants/theme.dart';

class ProductCard extends StatelessComponent {
  final String id;
  final String title;
  final String imageUrl;
  final String price;
  final String originalPrice;
  final int rating;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.rating,
  });

  @override
  Component build(BuildContext context) {
    return Link(
      to: '/product/$id',
      child: div(classes: 'product-card', [
        div(classes: 'product-image-container', [
          img(src: imageUrl, classes: 'product-image'),
          div(classes: 'rating', [
            for (int i = 0; i < 5; i++) span(classes: i < rating ? 'star filled' : 'star', [.text('★')]),
          ]),
        ]),
        div(classes: 'product-info', [
          h3([.text(title)]),
          div(classes: 'price-section', [
            span(classes: 'price', [.text('¥$price')]),
            if (originalPrice != price) span(classes: 'original-price', [.text('¥$originalPrice')]),
          ]),
          button(classes: 'add-to-cart-btn', [.text('加入购物车')]),
        ]),
      ]),
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.product-card', [
      css('&').styles(
        backgroundColor: Colors.white,
        radius: .all(.circular(8.px)),
        overflow: .hidden,
        cursor: .pointer,
      ),
      css('&:hover').styles(
        transform: Transform.scale(1.02),
      ),
      css('.product-image-container').styles(
        position: .relative(),
      ),
      css('.product-image').styles(
        width: 100.percent,
        height: 200.px,
      ),
      css('.rating').styles(
        position: .absolute(top: 8.px, right: 8.px),
        backgroundColor: const Color('#ffffffcc'),
        padding: .symmetric(horizontal: 0.5.em, vertical: 0.25.em),
        radius: .all(.circular(4.px)),
      ),
      css('.star').styles(
        color: const Color('#ddd'),
        fontSize: 0.8.em,
      ),
      css('.star.filled').styles(
        color: const Color('#ffd700'),
      ),
      css('.product-info').styles(
        padding: .all(1.em),
      ),
      css('h3').styles(
        margin: .unset,
        fontSize: 1.1.em,
        lineHeight: 1.4.em,
        color: Colors.black,
      ),
      css('.price-section').styles(
        display: .flex,
        alignItems: .center,
      ),
      css('.price').styles(
        fontSize: 1.2.em,
        fontWeight: .bold,
        color: const Color('#e74c3c'),
      ),
      css('.original-price').styles(
        color: const Color('#999'),
        textDecoration: TextDecoration(line: .lineThrough),
        fontSize: 0.9.em,
      ),
      css('.add-to-cart-btn').styles(
        width: 100.percent,
        backgroundColor: primaryColor,
        color: Colors.white,
        border: .none,
        padding: .symmetric(vertical: 0.5.em),
        radius: .all(.circular(4.px)),
        cursor: .pointer,
        fontSize: 0.9.em,
      ),
      css('.add-to-cart-btn:hover').styles(
        backgroundColor: const Color('#2980b9'),
      ),
    ]),
  ];
}
