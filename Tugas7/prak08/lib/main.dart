import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'food_menu.dart';
import 'cart_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Flutter Adelia Nurlina Putri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Selamat datang do Praktikum Flutter',
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              );
            },
              child: const Text('Menu'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              child: const Text('About'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage ({Key? key}) : super(key: key);
  @override
  _MenuPageState createState() => _MenuPageState();
}
class _MenuPageState extends State<MenuPage> {
  List<CartItem> cartItems = [];
  List<CartItem> _cartItems = [];
  List<FoodMenu> foodMenus = [
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90bylwYWdlfHx8fGVufDB8fHx8&auto=format&fit=crор&w=1470&q=80',
      name: 'Pasta',
      price: 45000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1676300185292-e23bb3db50fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90bylwYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      name: 'Beef Bourguignon',
      price: 55000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1621841957884-1210fe19d66d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90bylwYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&9=80',
      name: 'Seafood Paella',
      price: 135000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1550675897-2505803ba4c0?ixlib=rb-4.0.3&ixid=MwxMjA3fDB8MHxwaG90by1wyWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      name: 'Pastel de Nata',
      price: 105000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1601702538934-efffab67ab65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90bylwYWdlfHx8fGVufDB8fHx8&auto-format&fit=crop&w=1470&q=80',
      name: 'Pickle Herring',
      price: 71000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1623961988350-66b064cb2977?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      name: 'Carpaccio ',
      price: 99000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1610360147031-26a1d395726e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wyWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      name: 'Roast & Yorkshire Pudding',
      price: 45000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1555196301-9acc011dfde4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90bylwYWdlfHx8fGVufDB8fHx8&auto=format&fit=crор&w=1470&q=80',
      name: 'Gyros with Tzatziki',
      price: 75000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixlib=rb-4.0.3&ixid-MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto-format&fit=crop&w=1470&q=80',
      name: 'Pizza with cheezy mushroom',
      price: 85000),
  FoodMenu (
      imageUrl: 'https://images.unsplash.com/photo-1624371414361-e670edf4898d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      name: 'Churros',
      price: 45000),
  ];

  void _addToCart(FoodMenu foodMenu) {
    setState(() {
      _cartItems.add(CartItem(foodMenu: foodMenu));
      print("_cartItems");
      _cartItems.forEach((element) {
        print(element.foodMenu.name);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartDialog(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
    body: GridView.builder (
      itemCount: foodMenus. length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  FoodDetailPage(foodMenu: foodMenus[index],
                  addToCart: _addToCart,
                  cartItems: _cartItems,
                  ),
            ),
          );
        },
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  foodMenus[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  foodMenus [index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text('Rp ${foodMenus[index].price.toStringAsFixed(0)}'),
            ],
          ),
        ),
      );
    },
    ),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String restaurantExteriorUrl = 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVUfDB8fHx8&auto=format&fit=crop&w=1470&q=80';
  String restaurantInteriorUrl = 'https://images.unsplash.com/photo-1587899897387-091ebd01a6b2?ixlib=rb-4.0.3&ixid=MnwxMiA3fDB8MHxwaG90by1wYWd1fHx8fGVufDB8fHx8&auto=format&fit=crop&w=1513&q=80';
  String restaurantName = 'Adel Bistro Restaurant';
  String restaurantLocation = 'Jl. Contoh No.1, Jakarta, Indonesia';
  String mapsUrl = 'https://maps. google.com/?q=-6.200000,106.816666';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              restaurantName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Foto Luar Restoran:'),
            SizedBox(height: 8),
            Image.network(restaurantExteriorUrl),
            SizedBox(height: 16),
            Text('Foto Interior Restoran:'),
            SizedBox(height: 8),
            Image.network(restaurantInteriorUrl),
            SizedBox(height: 16),
            Text(
                'Lokasi:',
                style: TextStyle (fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(restaurantLocation),
        SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () async {
            await launch(mapsUrl);
          },

          icon: Icon(Icons.map),
          label: Text('Buka di Google Maps'),
        ),
        ],
        ),
        ),
      ),
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final FoodMenu foodMenu;
  final List<CartItem> cartItems;
  final void Function(FoodMenu) addToCart;
  FoodDetailPage ( {
    Key? key,
  required this.foodMenu,
  required this.addToCart,
  required this.cartItems,
  }) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text (foodMenu.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartDialog(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(foodMenu.imageUrl),
            SizedBox (height: 16),
            Text (
              foodMenu.name,
              style: TextStyle (fontSize: 24, fontWeight: FontWeight.bold),
            ) ,
            SizedBox (height: 8),
            Text ('Harga: Rp ${foodMenu.price.toStringAsFixed(0)}') ,
            ElevatedButton(onPressed: () {
              addToCart(foodMenu);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                    Text('${foodMenu.name} ditambahkan ke keranjang'),
                ),
              );
            },
              child: Text('Tambah ke Keranjang'),
            ),
            ],
    ),
    ),
      ),
    );
  }
}

class CartDialog extends StatelessWidget {
  final List<CartItem> cartItems;

  CartDialog({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    int itemCount = cartItems.fold<int>(0, (sum, item) => sum + item.quantity);
    double totalPrice = cartItems.fold<double>(0, (sum, item) => sum + item.foodMenu.price * item.quantity);

    print("itemCount $itemCount");
    print("totalPrice $totalPrice");

    return Scaffold(
      appBar: AppBar(
        title: Text("Keranjang"),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              print("a. $cartItems");
              return ListTile(
                leading: Image.network(
                  cartItems[index].foodMenu.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(cartItems[index].foodMenu.name),
                subtitle: Text (
                    'RP ${cartItems[index].foodMenu.price.toStringAsFixed(0)} x ${cartItems[index].quantity.toStringAsFixed(0)}'),
              );
            },
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Total Price Rp. $totalPrice"),
              )
          )
        ],
      ),
    );
  }
}

