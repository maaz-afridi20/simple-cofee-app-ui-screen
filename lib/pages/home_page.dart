import 'package:cofeeappui/utils/cofee_tile.dart';
import 'package:cofeeappui/utils/cofee_types.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List cofeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Milk Cofee',
      false,
    ],
    [
      'black',
      false,
    ],
    [
      'tea',
      false,
    ],
    [
      'Cold cofee',
      false,
    ],
  ];

  void cofeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < cofeeType.length; i++) {
        cofeeType[i][1] = false;
      }
      cofeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // ignore: prefer_const_constructors
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          // find the best cofee for u
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best cofee for you",
              style: TextStyle(fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // search bar

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your cofee....',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25.0),

          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cofeeType.length,
              itemBuilder: (BuildContext context, int index) {
                return CofeeTypes(
                    cofeeType: cofeeType[index][0],
                    isSelected: cofeeType[index][1],
                    onTap: () {
                      cofeeTypeSelected(index);
                    });
              },
            ),
          ),

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CofeeTile(
                  cofeeImagePath: 'lib/images/latte.jpg',
                  cofeeName: 'Latte',
                  cofeePrice: '4.30',
                ),
                CofeeTile(
                  cofeeImagePath: 'lib/images/latte.jpg',
                  cofeeName: 'Cappucino',
                  cofeePrice: '10.30',
                ),
                CofeeTile(
                  cofeeImagePath: 'lib/images/latte.jpg',
                  cofeeName: 'MilkCofee',
                  cofeePrice: '13.30',
                ),
                CofeeTile(
                  cofeeImagePath: 'lib/images/latte.jpg',
                  cofeeName: 'Latte',
                  cofeePrice: '4.30',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
