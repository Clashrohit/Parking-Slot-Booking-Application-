import 'package:flutter/material.dart';

class ParkingSlot extends StatefulWidget {
  const ParkingSlot({super.key});

  @override
  State<ParkingSlot> createState() => _ParkingSlotState();
}

class _ParkingSlotState extends State<ParkingSlot> {
  List<bool> _slots = List.generate(10, (index) => false); // 10 parking slots, false = available

  void _toggleSlot(int index) {
    setState(() {
      _slots[index] = !_slots[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Slot App'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: _slots.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _toggleSlot(index),
            child: Container(
              decoration: BoxDecoration(
                color: _slots[index] ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Slot ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
