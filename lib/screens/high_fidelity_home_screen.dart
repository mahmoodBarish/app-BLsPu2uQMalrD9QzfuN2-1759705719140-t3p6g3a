import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityHomeScreen extends StatefulWidget {
  const HighFidelityHomeScreen({super.key});

  @override
  State<HighFidelityHomeScreen> createState() => _HighFidelityHomeScreenState();
}

class _HighFidelityHomeScreenState extends State<HighFidelityHomeScreen> {
  int _bottomNavIndex = 0;
  String _selectedCategory = 'All Coffee';

  final List<String> _categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano'
  ];

  final List<Map<String, String>> _products = [
    {
      'name': 'Caffe Mocha',
      'description': 'Deep Foam',
      'price': '4.53',
      'rating': '4.8',
      'image': 'assets/images/I216_192_417_715.png',
    },
    {
      'name': 'Flat White',
      'description': 'Espresso',
      'price': '3.53',
      'rating': '4.8',
      'image': 'assets/images/I216_208_417_717.png',
    },
    {
      'name': 'Caffe Panna',
      'description': 'Ice/Hot',
      'price': '5.53',
      'rating': '4.8',
      'image': 'assets/images/I216_224_417_718.png',
    },
    {
      'name': 'Mocha Fusi',
      'description': 'Ice/Hot',
      'price': '7.53',
      'rating': '4.8',
      'image': 'assets/images/I216_240_417_716.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildCategories(),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF131313),
            Color(0xFF313131),
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: GoogleFonts.sora(
                          color: const Color(0xFFA2A2A2), fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Bilzen, Tanjungbalai',
                          style: GoogleFonts.sora(
                              color: const Color(0xFFDDDDDD),
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                        const Icon(Icons.keyboard_arrow_down,
                            color: Color(0xFFDDDDDD)),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset('assets/images/I216_106_417_719.png',
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search coffee',
                      hintStyle:
                          GoogleFonts.sora(color: const Color(0xFF989898)),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: const Color(0xFF313131),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC67C4E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildPromoBanner(),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/216_258.png',
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 13,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFED5151),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Promo',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 24,
            child: Container(
              color: const Color(0xFF131313).withOpacity(0.7),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Buy one get',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  height: 1.2,
                ),
              ),
            ),
          ),
          Positioned(
            top: 85,
            left: 24,
            child: Container(
              color: const Color(0xFF131313).withOpacity(0.7),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'one FREE',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == _selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color:
                      isSelected ? const Color(0xFFC67C4E) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: GoogleFonts.sora(
                      color: isSelected ? Colors.white : const Color(0xFF2F4B4E),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(_products[index]);
      },
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return GestureDetector(
      onTap: () {
        context.push('/detail_item');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    product['image']!,
                    height: 132,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFFBBE21), size: 12),
                        const SizedBox(width: 4),
                        Text(
                          product['rating']!,
                          style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name']!,
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2F2D2C),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product['description']!,
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            color: const Color(0xFF9B9B9B),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ${product['price']}',
                          style: GoogleFonts.sora(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2F4B4E),
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC67C4E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add,
                                color: Colors.white, size: 20),
                            onPressed: () {
                              context.push('/order');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_filled, 0),
          _buildNavItem(Icons.favorite, 1),
          _buildNavItem(Icons.shopping_bag, 2),
          _buildNavItem(Icons.notifications, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _bottomNavIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 2) {
          context.push('/order');
        } else {
          setState(() {
            _bottomNavIndex = index;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                isSelected ? const Color(0xFFC67C4E) : const Color(0xFF8D8D8D),
            size: 28,
          ),
          if (isSelected) ...[
            const SizedBox(height: 6),
            Container(
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                color: Color(0xFFC67C4E),
                shape: BoxShape.circle,
              ),
            ),
          ]
        ],
      ),
    );
  }
}