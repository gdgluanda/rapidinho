import 'package:rapidinho/model/delivery.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/home_card.dart';
import 'package:rapidinho/model/navigation_category.dart';
import 'package:rapidinho/ui/styling/rapidinho_icon.dart';

List<NavigationCategory> navigationCategories = [
  NavigationCategory('Casa', RapidinhoIcon.homeIcon, 0),
  NavigationCategory('Entregas', RapidinhoIcon.motorCycle, 1),
  NavigationCategory('Compras', RapidinhoIcon.shoppingCart, 2),
  NavigationCategory('Conta', RapidinhoIcon.account, 3),
];

List<FilterItem> filterList = [
  FilterItem('Todos', true),
  FilterItem('Hoje', false),
  FilterItem('Recomendado', false),
  FilterItem('Permitido', false),
  FilterItem('Popular', false),
  FilterItem('Novos', false),
];

List<HomeCard> homeCardItemList1 = [
  HomeCard(
      name: 'Fahita\nChouriço',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item.png'),
  HomeCard(
      name: 'Hamburger\nBaicon',
      filter: [0, 4, 1],
      assetPath: 'assets/images/home_items/home_item1.jpg'),
  HomeCard(
      name: 'Ovos\nEstrelados',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item5.jpg'),
  HomeCard(
      name: 'Pudim\nCereja',
      filter: [0, 3, 5],
      assetPath: 'assets/images/home_items/home_item10.jpg'),
];

List<HomeCard> homeCardItemList2 = [
  HomeCard(
      name: 'Chá\nPreto',
      filter: [5],
      assetPath: 'assets/images/home_items/home_item7.jpg'),
  HomeCard(
      filter: [0, 1, 2],
      name: 'Sumo\nMaçã',
      assetPath: 'assets/images/home_items/home_item9.jpg'),
  HomeCard(
      filter: [2, 3],
      name: 'Caipirinha\nLimão',
      assetPath: 'assets/images/home_items/home_item11.jpg'),
  HomeCard(
      filter: [0, 5],
      name: 'Vinho\nTinto',
      assetPath: 'assets/images/home_items/home_item13.jpg'),

];

List<HomeCard> homeCardItemList3 = [
  HomeCard(
      name: 'Trages\nAfricanos',
      filter: [3, 4],
      assetPath: 'assets/images/home_items/home_item3.jpg'),
  HomeCard(
      name: 'Buque\nRosas',
      filter: [1, 3],
      assetPath: 'assets/images/home_items/home_item4.jpg'),
  HomeCard(
      name: 'iPhone\nX',
      filter: [5],
      assetPath: 'assets/images/home_items/home_item8.jpg'),
];

class MockData {
  static final List<Delivery> deliveries = [
    Delivery(
      name: 'Pizza Quatro Estações',
      locationName:'Rapidinho\'s Office',
      locationIndex: 2,
      category: DeliveryCategory.Pizza,
      vendor: 'Pizza Hunt',
      time: DateTime.now(),
      details: DeliveryCategoryDetails(
        'assets/images/deliverables/pizza.png',
        'Pizza',
      ),
    ),
    Delivery(
      name: 'Caixa de Chocolates',
      locationName:'Avenida Shopping',
      locationIndex: 1,
      category: DeliveryCategory.Present,
      vendor: 'Candando',
      time: DateTime.now(),
      details: DeliveryCategoryDetails(
        'assets/images/deliverables/present.png',
        'Presente',
      ),
    ),
    Delivery(
      name: 'Nike Air VaporMax 97',
      locationName:'Alvalade',
      locationIndex: 1,
      category: DeliveryCategory.Wear,
      vendor: 'Imaginarium',
      time: DateTime.now(),
      details: DeliveryCategoryDetails(
        'assets/images/deliverables/wear.png',
        'Vestuário',
      ),
    ),
    Delivery(
      name: 'Carta Confidencial',
      locationName:'Escritorio',
      locationIndex: 0,
      category: DeliveryCategory.Mail,
      vendor: 'Boss',
      time: DateTime.now(),
      details: DeliveryCategoryDetails(
        'assets/images/deliverables/mail.png',
        'Documento',
      ),
    ),
  ];
}