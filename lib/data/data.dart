import 'package:rapidinho/model/delivery.dart';
import 'package:rapidinho/model/navigation_category.dart';
import 'package:rapidinho/ui/styling/rapidinho_icon.dart';

List<NavigationCategory> navigationCategories = [
  NavigationCategory('Casa', RapidinhoIcon.homeIcon, 0),
  NavigationCategory('Entregas', RapidinhoIcon.motorCycle, 1),
  NavigationCategory('Compras', RapidinhoIcon.shoppingCart, 2),
  NavigationCategory('Conta', RapidinhoIcon.account, 3),
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
    ),
    Delivery(
      name: 'Caixa de Chocolates',
      locationName:'Avenida Shopping',
      locationIndex: 1,
      category: DeliveryCategory.Present,
      vendor: 'Candando',
      time: DateTime.now(),
    ),
    Delivery(
      name: 'Nike Air VaporMax 97',
      locationName:'Alvalade',
      locationIndex: 1,
      category: DeliveryCategory.Mail,
      vendor: 'Imaginarium',
      time: DateTime.now(),
    ),
    Delivery(
      name: 'Carta Confidencial',
      locationName:'Escritorio',
      locationIndex: 0,
      category: DeliveryCategory.Mail,
      vendor: 'Boss',
      time: DateTime.now(),
    ),
  ];


}