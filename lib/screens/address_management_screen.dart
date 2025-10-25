import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../services/google_maps_service.dart';
import '../localization/app_localizations.dart';

class AddressManagementScreen extends StatefulWidget {
  const AddressManagementScreen({super.key});

  @override
  State<AddressManagementScreen> createState() =>
      _AddressManagementScreenState();
}

class _AddressManagementScreenState extends State<AddressManagementScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLocation;
  Set<Marker> _markers = {};
  List<Map<String, dynamic>> _addresses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
    _loadAddresses();
  }

  Future<void> _loadCurrentLocation() async {
    final position = await GoogleMapsService.getCurrentLocation();
    if (position != null) {
      setState(() {
        _currentLocation = GoogleMapsService.positionToLatLng(position);
        _markers.add(
          Marker(
            markerId: const MarkerId('current_location'),
            position: _currentLocation!,
            infoWindow: const InfoWindow(title: 'Current Location'),
          ),
        );
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _loadAddresses() {
    // Mock addresses - in real app, load from database
    setState(() {
      _addresses = [
        {
          'id': '1',
          'name': 'Home',
          'address': '123 Main Street, Riyadh',
          'lat': 24.7136,
          'lng': 46.6753,
          'isDefault': true,
        },
        {
          'id': '2',
          'name': 'Work',
          'address': '456 Business District, Riyadh',
          'lat': 24.7200,
          'lng': 46.6800,
          'isDefault': false,
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).addresses),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
            ),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Map Section
                Expanded(
                  flex: 2,
                  child: _currentLocation != null
                      ? GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            _mapController = controller;
                          },
                          initialCameraPosition: CameraPosition(
                            target: _currentLocation!,
                            zoom: 15.0,
                          ),
                          markers: _markers,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                        )
                      : Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_off,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  ).locationNotAvailable,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),

                // Addresses List
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context).savedAddresses,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: _addNewAddress,
                              icon: const Icon(Icons.add),
                              label: Text(
                                AppLocalizations.of(context).addAddress,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2563EB),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _addresses.length,
                            itemBuilder: (context, index) {
                              final address = _addresses[index];
                              return _buildAddressCard(address);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildAddressCard(Map<String, dynamic> address) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: address['isDefault']
              ? const Color(0xFF2563EB)
              : Colors.grey[300]!,
          width: address['isDefault'] ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: address['isDefault']
                  ? const Color(0xFF2563EB).withOpacity(0.1)
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              address['isDefault'] ? Icons.home : Icons.location_on,
              color: address['isDefault']
                  ? const Color(0xFF2563EB)
                  : Colors.grey[600],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      address['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    if (address['isDefault']) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2563EB),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          AppLocalizations.of(context).defaultText,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  address['address'],
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'edit') {
                _editAddress(address);
              } else if (value == 'delete') {
                _deleteAddress(address);
              } else if (value == 'set_default') {
                _setDefaultAddress(address);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: [
                    const Icon(Icons.edit, size: 16),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context).edit),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'set_default',
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 16),
                    const SizedBox(width: 8),
                    Text(AppLocalizations.of(context).setAsDefault),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    const Icon(Icons.delete, size: 16, color: Colors.red),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context).delete,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addNewAddress() {
    final nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).addAddress),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).addressName,
                hintText: 'Home, Work, etc.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.blue[600], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).usingCurrentLocation,
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                _addAddressWithCurrentLocation(nameController.text);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context).enterAddressName,
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(AppLocalizations.of(context).add),
          ),
        ],
      ),
    );
  }

  void _addAddressWithCurrentLocation(String name) async {
    if (_currentLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).locationNotAvailable),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Get address from current location
    final addressText =
        await GoogleMapsService.getAddressFromCoordinates(_currentLocation!) ??
        '${_currentLocation!.latitude.toStringAsFixed(4)}, ${_currentLocation!.longitude.toStringAsFixed(4)}';

    final newAddress = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': name,
      'address': addressText,
      'lat': _currentLocation!.latitude,
      'lng': _currentLocation!.longitude,
      'isDefault': _addresses.isEmpty, // First address is default
    };

    setState(() {
      _addresses.add(newAddress);
    });

    // Add marker to map
    _markers.add(
      Marker(
        markerId: MarkerId(newAddress['id'] as String),
        position: LatLng(
          newAddress['lat'] as double,
          newAddress['lng'] as double,
        ),
        infoWindow: InfoWindow(title: newAddress['name'] as String),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${AppLocalizations.of(context).add} ${newAddress['name']}',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _addAddressToList(String name, String address) {
    final newAddress = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': name,
      'address': address,
      'lat': 24.7136 + (DateTime.now().millisecondsSinceEpoch % 1000) / 100000,
      'lng': 46.6753 + (DateTime.now().millisecondsSinceEpoch % 1000) / 100000,
      'isDefault': _addresses.isEmpty, // First address is default
    };

    setState(() {
      _addresses.add(newAddress);
    });

    // Add marker to map
    _markers.add(
      Marker(
        markerId: MarkerId(newAddress['id'] as String),
        position: LatLng(
          newAddress['lat'] as double,
          newAddress['lng'] as double,
        ),
        infoWindow: InfoWindow(title: newAddress['name'] as String),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${AppLocalizations.of(context).add} ${newAddress['name']}',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _editAddress(Map<String, dynamic> address) {
    final nameController = TextEditingController(text: address['name']);
    final addressController = TextEditingController(text: address['address']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context).edit),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).addressName,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).address,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  addressController.text.isNotEmpty) {
                setState(() {
                  address['name'] = nameController.text;
                  address['address'] = addressController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${AppLocalizations.of(context).edit} ${address['name']}',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            child: Text(AppLocalizations.of(context).save),
          ),
        ],
      ),
    );
  }

  void _deleteAddress(Map<String, dynamic> address) {
    setState(() {
      _addresses.removeWhere((addr) => addr['id'] == address['id']);
      // Remove marker from map
      _markers.removeWhere((marker) => marker.markerId.value == address['id']);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${AppLocalizations.of(context).delete} ${address['name']}',
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _setDefaultAddress(Map<String, dynamic> address) {
    setState(() {
      for (var addr in _addresses) {
        addr['isDefault'] = false;
      }
      address['isDefault'] = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${address['name']} ${AppLocalizations.of(context).setAsDefault}',
        ),
      ),
    );
  }
}
