import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---

// --- End Shims ---

// Placeholder for the form page (to be created later)
class InventoryRequestFormPage extends StatelessWidget {
  const InventoryRequestFormPage({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(
    appBar: CupertinoNavigationBar(middle: Text('New Request')),
    body: Center(child: Text('Inventory Request Form Content Goes Here')),
  );
}

class InventoryRequestListPage extends StatelessWidget {
  InventoryRequestListPage({super.key});

  final List<Map<String, dynamic>> requests = [
    {
      'id': 'IR-0012',
      'item': 'HVAC Filter Set (MERV 13)',
      'quantity': 5,
      'date': '2025-11-28',
      'status': 'Approved',
      'color': AppColors.dataViz4, // Green
    },
    {
      'id': 'IR-0013',
      'item': 'Aerosol Insecticide (2L)',
      'quantity': 2,
      'date': '2025-11-29',
      'status': 'Waiting Approval',
      'color': AppColors.dataViz3, // Amber
    },
    {
      'id': 'IR-0011',
      'item': 'Cleaning Solution (Industrial)',
      'quantity': 10,
      'date': '2025-11-25',
      'status': 'Delivered',
      'color': AppColors.dataViz1, // Blue
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        middle: const Text('Inventory Requests'),
        backgroundColor: AppColors.surfaceBackground,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'My Recent Material Requests',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final request = requests[index];
                return _buildRequestCard(context, request);
              },
            ),
          ),
          _buildNewRequestButton(context),
        ],
      ),
    );
  }

  Widget _buildRequestCard(BuildContext context, Map<String, dynamic> request) {
    final statusColor = request['color'] as Color;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: statusColor.withOpacity(0.5), width: 1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Icon(CupertinoIcons.cube_box, color: statusColor, size: 30),
        title: Text(
          request['item'] as String,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('ID: ${request['id']} | Qty: ${request['quantity']}'),
            Text('Requested: ${request['date']}'),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
          child: Text(
            request['status'] as String,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: statusColor, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          // Future navigation to view request details
        },
      ),
    );
  }

  Widget _buildNewRequestButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, -3)),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const InventoryRequestFormPage()));
          },
          icon: const Icon(CupertinoIcons.add, size: 20),
          label: const Text('CREATE NEW REQUEST'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.dataViz4, // Green for creation/action
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
