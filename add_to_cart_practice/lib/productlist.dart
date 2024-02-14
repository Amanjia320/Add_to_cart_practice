// // ignore_for_file: non_constant_identifier_names, unused_local_variable

// import 'package:add_to_cart_practice/cart_model.dart';
// import 'package:add_to_cart_practice/cart_provider.dart';
// import 'package:add_to_cart_practice/db_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductList extends StatefulWidget {
//   const ProductList({super.key});

//   @override
//   State<ProductList> createState() => _ProductListState();
// }

// DBHelper? dbHelper = DBHelper();

// List<String> productName = [
//   'Orange',
//   'Banana',
//   'Cherry',
//   'Grapes',
//   'Mango',
//   'Peach',
//   'Mixed fruit Basket',
// ];
// List<String> productUnit = [
//   'Dozen',
//   'Dozen',
//   'kG',
//   'kG',
//   'KG',
//   'KG',
//   'KG',
// ];

// List<int> productPrice = [
//   10,
//   20,
//   30,
//   40,
//   50,
//   60,
//   70,
// ];

// List<String> productImage = [
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsgudwR9mUhcKoREthPze6Q3lR8sW9E0YirbAt8ZW2gWWylvgmZEiR94GuYEQPxEAvoxo&usqp=CAU',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsgudwR9mUhcKoREthPze6Q3lR8sW9E0YirbAt8ZW2gWWylvgmZEiR94GuYEQPxEAvoxo&usqp=CAU',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsgudwR9mUhcKoREthPze6Q3lR8sW9E0YirbAt8ZW2gWWylvgmZEiR94GuYEQPxEAvoxo&usqp=CAU',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsgudwR9mUhcKoREthPze6Q3lR8sW9E0YirbAt8ZW2gWWylvgmZEiR94GuYEQPxEAvoxo&usqp=CAU',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsgudwR9mUhcKoREthPze6Q3lR8sW9E0YirbAt8ZW2gWWylvgmZEiR94GuYEQPxEAvoxo&usqp=CAU',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsgudwR9mUhcKoREthPze6Q3lR8sW9E0YirbAt8ZW2gWWylvgmZEiR94GuYEQPxEAvoxo&usqp=CAU',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsgudwR9mUhcKoREthPze6Q3lR8sW9E0YirbAt8ZW2gWWylvgmZEiR94GuYEQPxEAvoxo&usqp=CAU',
// ];

// class _ProductListState extends State<ProductList> {
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<CartProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Product List',
//           style: TextStyle(
//               fontWeight: FontWeight.w500, color: Colors.white, fontSize: 26),
//         ),
//         backgroundColor: Colors.teal[300],
//         centerTitle: true,
//         actions: [
//           Badge(
//             label: Consumer<CartProvider>(
//               builder: (context, value, child) {
//                 return Text(value.getCounter().toString());
//               },
//             ),
//             backgroundColor: Colors.red,
//             child: const Icon(
//               Icons.shopping_bag_outlined,
//               color: Colors.white,
//               size: 26,
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 itemCount: productName.length,
//                 itemBuilder: (Context, index) {
//                   return Card(
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 8, bottom: 8, left: 8),
//                               child: Image(
//                                   height: 100,
//                                   width: 100,
//                                   image: NetworkImage(productImage[index])),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     productName[index],
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18),
//                                   ),
//                                   Text(
//                                     "${productUnit[index]} \$${productPrice[index]}",
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   InkWell(
//                                     onTap: () {
//                                       dbHelper!
//                                           .insert(Cart(
//                                         id: index,
//                                         productId: index.toString(),
//                                         productName:
//                                             productName[index].toString(),
//                                         initialPrice: productPrice[index],
//                                         productPrice: productPrice[index],
//                                         quantity: 1,
//                                         unitTag: productUnit[index].toString(),
//                                         image: productImage[index].toString(),
//                                       ))
//                                           .then((value) {
//                                         // ignore: avoid_print
//                                         print('Product is added to cart');
//                                         cart.addTotalPrice(double.parse(
//                                             productPrice[index].toString()));
//                                         cart.addCounter();
//                                       }).onError((error, stackTrace) {
//                                         // ignore: avoid_print
//                                         cart.addCounter();
//                                         print(" ERROR : $error");
//                                       });
//                                     },
//                                     child: Container(
//                                       height: 35,
//                                       width: 100,
//                                       decoration: BoxDecoration(
//                                           color: Colors.teal[200],
//                                           borderRadius:
//                                               BorderRadius.circular(5)),
//                                       child: const Center(
//                                           child: Text(
//                                         'Add to card',
//                                         style: TextStyle(
//                                             fontSize: 15,
//                                             fontWeight: FontWeight.bold),
//                                       )),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
