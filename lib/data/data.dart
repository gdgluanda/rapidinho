import 'package:rapidinho/model/delivery.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/product.dart';
import 'package:rapidinho/model/tabs.dart';
import 'package:rapidinho/styling/rapidinho_icon.dart';

List<TabItem> navigationTabs = [
  TabItem('Casa', RapidinhoIcon.homeIcon, NavigationTab.Home),
  TabItem('Entregas', RapidinhoIcon.motorCycle, NavigationTab.Delivery),
  TabItem('Compras', RapidinhoIcon.shoppingCart, NavigationTab.Cart),
  TabItem('Conta', RapidinhoIcon.account, NavigationTab.Account),
];

const List<FilterItem> filterList = [
  const FilterItem('Todos', true, FilterType.All),
  const FilterItem('Hoje', false, FilterType.Today),
  const FilterItem('Recomendado', false, FilterType.Recommended),
  const FilterItem('Permitido', false, FilterType.Allowed),
  const FilterItem('Popular', false, FilterType.Popular),
  const FilterItem('Novos', false, FilterType.New),
];

List<Product> homeCardItemList1 = [
  Product(
      name: 'Fahita\nChouriço',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item.png'),
  Product(
      name: 'Hamburger\nBaicon',
      filter: [0, 4, 1],
      assetPath: 'assets/images/home_items/home_item1.jpg'),
  Product(
      name: 'Ovos\nEstrelados',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item5.jpg'),
  Product(
      name: 'Pudim\nCereja',
      filter: [0, 3, 5],
      assetPath: 'assets/images/home_items/home_item10.jpg'),
  Product(
      name: 'Chá\nPreto',
      filter: [5],
      assetPath: 'assets/images/home_items/home_item7.jpg'),
  Product(
      filter: [0, 1, 2],
      name: 'Sumo\nMaçã',
      assetPath: 'assets/images/home_items/home_item9.jpg'),
  Product(
      filter: [2, 3],
      name: 'Caipirinha\nLimão',
      assetPath: 'assets/images/home_items/home_item11.jpg'),
  Product(
      filter: [0, 5],
      name: 'Vinho\nTinto',
      assetPath: 'assets/images/home_items/home_item13.jpg'),
  Product(
      name: 'Trages\nAfricanos',
      filter: [3, 4],
      assetPath: 'assets/images/home_items/home_item3.jpg'),
  Product(
      name: 'Buque\nRosas',
      filter: [1, 3],
      assetPath: 'assets/images/home_items/home_item4.jpg'),
  Product(
      name: 'iPhone\nX',
      filter: [1, 5],
      assetPath: 'assets/images/home_items/home_item8.jpg'),
];

class MockData {
  static final List<Product> products = [
    Product(
      name: 'Pizzas',
      assetPath:'assets/images/deliverables/pizza.png'
    ),
    Product(
        name: 'Bebidas',
        assetPath: 'assets/images/deliverables/drink.png'
    ),
    Product(
        name: 'Books',
        assetPath: 'assets/images/deliverables/books.png'
    ),
    Product(
        name: 'Refeições',
        assetPath: 'assets/images/deliverables/food.png'
    ),
    Product(
        name: 'Hamburger',
        assetPath: 'assets/images/deliverables/hamburger.png'
    ),
    Product(
        name: 'Gelados',
        assetPath: 'assets/images/deliverables/ice_cream.png'
    ),
    Product(
        name: 'Convites',
        assetPath: 'assets/images/deliverables/letter.png'
    ),
    Product(
        name: 'Cartas',
        assetPath: 'assets/images/deliverables/mail.png'
    ),
    Product(
        name: 'Presentes',
        assetPath: 'assets/images/deliverables/present.png'
    ),
    Product(
        name: 'Vestuario',
        assetPath: 'assets/images/deliverables/wear.png'
    ),
  ];
  static final List<Delivery> deliveries = [
    Delivery(
      name: 'Pizza Quatro Estações',
      locationName:'Rapidinho\'s Office',
      locationIndex: 2,
      category: ProductCategory.Pizza,
      vendor: 'Pizza Hunt',
      time: DateTime.now(),
      details: products[0],
    ),
    Delivery(
      name: 'Caixa de Chocolates',
      locationName:'Avenida Shopping',
      locationIndex: 1,
      category: ProductCategory.Present,
      vendor: 'Candando',
      time: DateTime.now(),
      details: products[8]
    ),
    Delivery(
      name: 'Nike Air VaporMax 97',
      locationName:'Alvalade',
      locationIndex: 1,
      category: ProductCategory.Wear,
      vendor: 'Imaginarium',
      time: DateTime.now(),
      details: products[9]
    ),
    Delivery(
      name: 'Carta Confidencial',
      locationName:'Escritorio',
      locationIndex: 0,
      category: ProductCategory.Mail,
      vendor: 'Boss',
      time: DateTime.now(),
      details: products[7]
    ),
  ];
}