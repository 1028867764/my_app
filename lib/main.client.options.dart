// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:my_app/components/header.dart' deferred as _header;
import 'package:my_app/components/sidebar.dart' deferred as _sidebar;
import 'package:my_app/pages/about.dart' deferred as _about;
import 'package:my_app/pages/brands.dart' deferred as _brands;
import 'package:my_app/pages/categories.dart' deferred as _categories;
import 'package:my_app/pages/home.dart' deferred as _home;
import 'package:my_app/pages/product.dart' deferred as _product;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'header': ClientLoader(
      (p) => _header.Header(),
      loader: _header.loadLibrary,
    ),
    'sidebar': ClientLoader(
      (p) => _sidebar.Sidebar(),
      loader: _sidebar.loadLibrary,
    ),
    'about': ClientLoader((p) => _about.About(), loader: _about.loadLibrary),
    'brands': ClientLoader(
      (p) => _brands.Brands(),
      loader: _brands.loadLibrary,
    ),
    'categories': ClientLoader(
      (p) => _categories.Categories(),
      loader: _categories.loadLibrary,
    ),
    'home': ClientLoader((p) => _home.Home(), loader: _home.loadLibrary),
    'product': ClientLoader(
      (p) => _product.ProductPage(productId: p['productId'] as String),
      loader: _product.loadLibrary,
    ),
  },
);
