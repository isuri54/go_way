import 'package:flutter/material.dart';
import 'footer.dart'; 

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the current index for the footer
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode(); // search bar

  final List<SearchableItem> _searchableItems = [
    SearchableItem(
      title: 'Bus Tracking',
      description: 'Track your bus in real-time',
      icon: Icons.directions_bus,
      route: '/bus-tracking',
    ),
    SearchableItem(
      title: 'Time table',
      description: 'Check bus schedules',
      icon: Icons.schedule,
      route: '/time-table',
    ),
    SearchableItem(
      title: 'Seats booking',
      description: 'Book your seat in advance',
      icon: Icons.event_seat,
      route: '/seats-booking',
    ),
    SearchableItem(
      title: 'Complaints',
      description: 'Submit your complaints',
      icon: Icons.report_problem,
      route: '/complaints',
    ),
    SearchableItem(
      title: 'Emergency',
      description: 'Emergency contacts and help',
      icon: Icons.emergency,
      route: '/emergency',
    ),
    SearchableItem(
      title: 'Settings',
      description: 'App settings and preferences',
      icon: Icons.settings,
      route: '/settings',
    ),
  ];

  // Function to handle footer navigation
  void _onFooterTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Define navigation logic for each footer item
    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1: // Seats
        Navigator.pushNamed(context, '/seats-booking');
        break;
      case 2: // QR
        Navigator.pushNamed(context, '/qr-scanner');
        break;
      case 3: // Wallet
        Navigator.pushNamed(context, '/wallet');
        break;
      case 4: // Profile
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  void dispose() {
    _searchFocusNode.dispose(); // Dispose the FocusNode
    _searchController.dispose(); // Dispose the TextEditingController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            // Remove focus from the search bar when tapping outside
            _searchFocusNode.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/logo.jpeg', height: 100),
                      SizedBox(height: 10),
                      Text('Your Journey, Your Way!',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome!',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('Osandi',
                            style: TextStyle(fontSize: 18, color: Colors.black54)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/user.png'),
                        radius: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode, // Assign FocusNode to the search bar
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                  onChanged: (query) {
                    // Update the UI when the search query changes
                    setState(() {});
                  },
                ),
                SizedBox(height: 40),

                // Section with 6 Buttons (2 Rows, 3 Columns)
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3, // 3 columns
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: _searchableItems
                        .where((item) =>
                            item.title.toLowerCase().contains(_searchController.text.toLowerCase()) ||
                            item.description.toLowerCase().contains(_searchController.text.toLowerCase()))
                        .map((item) => _buildFeatureButton(context, item))
                        .toList(),
                  ),
                ),

                SizedBox(height: 20),

                // Small buttons at the bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: _buildActiveButton(context, 'GoPay', Icons.payment)),
                    SizedBox(width: 20),
                    Expanded(child: _buildActiveButton(context, 'User Points', Icons.star)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _currentIndex,
        onTap: _onFooterTapped, // Pass the navigation function to the footer
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context, SearchableItem item) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, item.route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFFFDE05),
            radius: 30,
            child: Icon(item.icon, color: Colors.black),
          ),
          SizedBox(height: 10),
          Text(item.title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildActiveButton(BuildContext context, String label, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 189, 240, 131),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: Color(0xFFFFDE05)),
          SizedBox(height: 10),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class SearchableItem {
  final String title;
  final String description;
  final IconData icon;
  final String route;

  SearchableItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
  });
}