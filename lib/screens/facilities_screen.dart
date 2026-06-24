import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FacilitiesScreen extends StatefulWidget {
  const FacilitiesScreen({super.key});

  @override
  State<FacilitiesScreen> createState() => _FacilitiesScreenState();
}

class _FacilitiesScreenState extends State<FacilitiesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedFacilityName;

  Future<void> _openMap() async {
    final query = selectedFacilityName ?? 'Rumah Sakit Terdekat';
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}');
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tidak dapat membuka peta')));
    }
  }

  Future<void> _getDirections() async {
    final query = selectedFacilityName ?? 'Rumah Sakit Terdekat';
    final url = Uri.parse('https://www.google.com/maps/dir/?api=1&destination=${Uri.encodeComponent(query)}');
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tidak dapat membuka peta')));
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fasilitas Terdekat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Rumah Sakit'),
            Tab(text: 'Klinik'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFacilityList(),
          const Center(child: Text('Data Klinik')),
        ],
      ),
    );
  }

  Widget _buildFacilityList() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildFacilityItem('RSUD Dr. Soetomo', '3.2 km', Icons.local_hospital),
        _buildFacilityItem('RS Siloam Surabaya', '4.1 km', Icons.local_hospital),
        _buildFacilityItem('RS Premier Surabaya', '5.0 km', Icons.local_hospital),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: _openMap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColor.withOpacity(0.5),
            foregroundColor: AppTheme.textDark,
          ),
          child: const Text('Lihat di Peta'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _getDirections,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryColorDark.withOpacity(0.8),
            foregroundColor: AppTheme.textDark,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Dapatkan Arah'),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.map, size: 16, color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFacilityItem(String name, String distance, IconData icon) {
    bool isSelected = selectedFacilityName == name;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFacilityName = name;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor.withOpacity(0.3) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected 
              ? Border.all(color: AppTheme.primaryColorDark) 
              : const Border(bottom: BorderSide(color: AppTheme.borderGrey)),
        ),
        child: Row(
          children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppTheme.greyBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  distance,
                  style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: AppTheme.textLight),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}
