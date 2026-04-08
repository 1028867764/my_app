// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:my_app/components/counter.dart' as _counter;
import 'package:my_app/components/header.dart' as _header;
import 'package:my_app/components/sidebar.dart' as _sidebar;
import 'package:my_app/components/product_card.dart' as _product_card;
import 'package:my_app/pages/about.dart' as _about;
import 'package:my_app/pages/brands.dart' as _brands;
import 'package:my_app/pages/categories.dart' as _categories;
import 'package:my_app/pages/home.dart' as _home;
import 'package:my_app/pages/product.dart' as _product;
import 'package:my_app/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _header.Header: ClientTarget<_header.Header>('header'),
    _sidebar.Sidebar: ClientTarget<_sidebar.Sidebar>('sidebar'),
    _about.About: ClientTarget<_about.About>('about'),
    _brands.Brands: ClientTarget<_brands.Brands>('brands'),
    _categories.Categories: ClientTarget<_categories.Categories>('categories'),
    _home.Home: ClientTarget<_home.Home>('home'),
    _product.ProductPage: ClientTarget<_product.ProductPage>(
      'product',
      params: __productProductPage,
    ),
  },
  styles: () => [
    ..._counter.CounterState.styles,
    ..._header.Header.styles,
    ..._sidebar.Sidebar.styles,
    ..._product_card.ProductCard.styles,
    ..._about.About.styles,
    ..._home.HomeState.styles,
    ..._product.ProductPage.styles,
    ..._app.App.styles,
  ],
);

Map<String, Object?> __productProductPage(_product.ProductPage c) => {
  'productId': c.productId,
};
