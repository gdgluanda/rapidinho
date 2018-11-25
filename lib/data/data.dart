import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rapidinho/model/delivery.dart';
import 'package:rapidinho/model/filter_item.dart';
import 'package:rapidinho/model/product_category.dart';
import 'package:rapidinho/model/product.dart';
import 'package:rapidinho/model/tab.dart';
import 'package:rapidinho/model/vendor.dart';
import 'package:rapidinho/styling/rapidinho_icon.dart';

List<TabItem> navigationTabs = [
  TabItem('Casa', RapidinhoIcon.homeIcon, 0),
  TabItem('Entregas', RapidinhoIcon.motorCycle, 1),
  TabItem('Compras', RapidinhoIcon.shoppingCart, 2),
  TabItem('Conta', RapidinhoIcon.account, 3),
];

const List<FilterItem> filterList = [
  const FilterItem('Todos', true, FilterType.All),
  const FilterItem('Hoje', false, FilterType.Today),
  const FilterItem('Recomendado', false, FilterType.Recommended),
  const FilterItem('Popular', false, FilterType.Popular),
  const FilterItem('Novos', false, FilterType.New),
];

List<ProductType> homeCardItemList1 = [
  ProductType(
      name: 'Fahita\nChouriço',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item.png'),
  ProductType(
      name: 'Hamburger\nBaicon',
      filter: [0, 4, 1],
      assetPath: 'assets/images/home_items/home_item1.jpg'),
  ProductType(
      name: 'Ovos\nEstrelados',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item5.jpg'),
  ProductType(
      name: 'Pudim\nCereja',
      filter: [0, 3, 5],
      assetPath: 'assets/images/home_items/home_item10.jpg'),
  ProductType(
      name: 'Chá\nPreto',
      filter: [5],
      assetPath: 'assets/images/home_items/home_item7.jpg'),
  ProductType(
      filter: [0, 1, 2],
      name: 'Sumo\nMaçã',
      assetPath: 'assets/images/home_items/home_item9.jpg'),
  ProductType(
      filter: [2, 3],
      name: 'Caipirinha\nLimão',
      assetPath: 'assets/images/home_items/home_item11.jpg'),
  ProductType(
      filter: [0, 5],
      name: 'Vinho\nTinto',
      assetPath: 'assets/images/home_items/home_item13.jpg'),
  ProductType(
      name: 'Trages\nAfricanos',
      filter: [3, 4],
      assetPath: 'assets/images/home_items/home_item3.jpg'),
  ProductType(
      name: 'Buque\nRosas',
      filter: [1, 3],
      assetPath: 'assets/images/home_items/home_item4.jpg'),
  ProductType(
      name: 'iPhone\nX',
      filter: [1, 5],
      assetPath: 'assets/images/home_items/home_item8.jpg'),
  ProductType(
      name: 'Fahita\nChouriço',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item.png'),
  ProductType(
      name: 'Hamburger\nBaicon',
      filter: [0, 4, 1],
      assetPath: 'assets/images/home_items/home_item1.jpg'),
  ProductType(
      name: 'Ovos\nEstrelados',
      filter: [0, 1, 4],
      assetPath: 'assets/images/home_items/home_item5.jpg'),
  ProductType(
      name: 'Pudim\nCereja',
      filter: [0, 3, 5],
      assetPath: 'assets/images/home_items/home_item10.jpg'),
  ProductType(
      name: 'Chá\nPreto',
      filter: [5],
      assetPath: 'assets/images/home_items/home_item7.jpg'),
  ProductType(
      filter: [0, 1, 2],
      name: 'Sumo\nMaçã',
      assetPath: 'assets/images/home_items/home_item9.jpg'),
  ProductType(
      filter: [2, 3],
      name: 'Caipirinha\nLimão',
      assetPath: 'assets/images/home_items/home_item11.jpg'),
  ProductType(
      filter: [0, 5],
      name: 'Vinho\nTinto',
      assetPath: 'assets/images/home_items/home_item13.jpg'),
  ProductType(
      name: 'Trages\nAfricanos',
      filter: [3, 4],
      assetPath: 'assets/images/home_items/home_item3.jpg'),
  ProductType(
      name: 'Buque\nRosas',
      filter: [1, 3],
      assetPath: 'assets/images/home_items/home_item4.jpg'),
  ProductType(
      name: 'iPhone\nX',
      filter: [1, 5],
      assetPath: 'assets/images/home_items/home_item8.jpg'),
];

class MockData {
  static final List<Product> productList = [
    Product(
      id: 0,
      itemName: 'Caipirinha de Limão',
      imagePath: 'assets/images/home_items/home_item11.jpg',
      price: 800.00,
      categoryId: 1,
      vendorId: 0,
      ingredients: {0: '70 Cl Cachaça', 1: '1 KG de Gelo em cubo', 2: 'Limoes', 3: '12 Culheres', 4: 'Folha de menta'},
      description: 'A caipirinha é o coquetel nacional do Brasil, feito com cachaça, açúcar e limão. A cachaça, também conhecida como caninha, ou qualquer um de uma infinidade de nomes tradicionais, é a bebida alcoólica destilada mais comum no Brasil.',
      recipe: 'Enrole o limão em sua tábua com a palma da sua mão para obter todos os sucos agradáveis, em seguida, corte-os em fatias e esprema o suco em um jarro grande de 1 ½ litro, colocando as fatias nele depois de espremê-las. \n Acrescente o açúcar e o gengibre e passe alguns minutos batendo e esmagando tudo com o final de um rolo de madeira para obter todos esses sabores. Metade encha o jarro com gelo picado e volte a bater. Despeje a cachaça e mexa bem. Tem um pouco de sabor, em seguida, ajustar a acidez ao seu gosto, adicionando mais açúcar, se necessário. Cubra o jarro com mais gelo picado e depois raspe as folhas de hortelã e mexa bem. Sirva e desfrute como um coquetel refrescante com os amigos.',
      isActive: true,
      servings: 8,
      cookTime: 10.0,
      estimatedDeliveryTime: 15.55,
      suggestedProducts: [],
      tags: ['Brazillian', 'Alcohol', 'Cocktail', 'Fruit', 'Dinner Party'],
      deliveryTax: 1500.00,
      rating: 4.8,
      recommendations: 'Você tem que entregar para os brasileiros, eles sabem misturar um coquetel',
    ),
  ];

  static final List<Vendor> vendorList = [
    Vendor(
      id: 0,
      name: 'Cassule\'s Restaurante',
      cityId: 0,
    )
  ];

  static final List<City> cities = [
    City(
      id: 0,
      cityName: 'Kilamba Kiaxi',
    ),
  ];

  static final List<ProductType> productCategoryList = [
    ProductType(
      name: 'Pizzas',
      assetPath: 'assets/images/deliverables/pizza.png',
      category: ProductCategory.Pizza,
    ),
    ProductType(
        name: 'Bebidas',
        assetPath: 'assets/images/deliverables/drink.png',
        category: ProductCategory.Drinks,
    ),
    ProductType(
        name: 'Livros',
        assetPath: 'assets/images/deliverables/books.png',
        category: ProductCategory.Book,
    ),
    ProductType(
        name: 'Refeições',
        assetPath: 'assets/images/deliverables/food.png',
        category: ProductCategory.Food
    ),
    ProductType(
        name: 'Hamburgers',
        assetPath: 'assets/images/deliverables/hamburger.png',
        category: ProductCategory.Hamburger,
    ),
    ProductType(
        name: 'Gelados',
        assetPath: 'assets/images/deliverables/ice_cream.png',
        category: ProductCategory.IceCream,
    ),
    ProductType(
        name: 'Convites',
        assetPath: 'assets/images/deliverables/letter.png',
        category: ProductCategory.Invites,
    ),
    ProductType(
        name: 'Cartas',
        assetPath: 'assets/images/deliverables/mail.png',
        category: ProductCategory.Mail,
    ),
    ProductType(
        name: 'Presentes',
        assetPath: 'assets/images/deliverables/present.png',
        category: ProductCategory.Present,
    ),
    ProductType(
        name: 'Vestuario',
        assetPath: 'assets/images/deliverables/wear.png',
        category: ProductCategory.Wear,
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
      details: productCategoryList[0],
      latLng: LatLng(-8.914714, 13.347579),
    ),
    Delivery(
      name: 'Caixa de Chocolates',
      locationName:'Avenida Shopping',
      locationIndex: 1,
      category: ProductCategory.Present,
      vendor: 'Candando',
      time: DateTime.now(),
      details: productCategoryList[8],
      latLng: LatLng(-8.854382, 13.358283),
    ),
    Delivery(
      name: 'Nike Air VaporMax 97',
      locationName:'Alvalade',
      locationIndex: 1,
      category: ProductCategory.Wear,
      vendor: 'Imaginarium',
      time: DateTime.now(),
      details: productCategoryList[9],
      latLng: LatLng(-8.770387, 13.252518),
    ),
    Delivery(
      name: 'Carta Confidencial',
      locationName:'Escritorio',
      locationIndex: 0,
      category: ProductCategory.Mail,
      vendor: 'Boss',
      time: DateTime.now(),
      details: productCategoryList[7],
      latLng: LatLng(-8.977916, 13.120809),
    ),
  ];
}