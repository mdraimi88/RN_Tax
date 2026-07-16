import 'dart:io';

import 'package:flutter/material.dart';

class ReceiptImageCard extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  const ReceiptImageCard({
    super.key,
    required this.imagePath,
    required this.onCameraPressed,
    required this.onGalleryPressed,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = imagePath != null && imagePath!.isNotEmpty;

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (!hasImage) ...[
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 64,
                      color: Colors.grey.shade500,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Tiada Gambar Resit',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Ambil gambar atau pilih dari galeri',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ] else ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(imagePath!),
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ],

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onCameraPressed,
                    icon: const Icon(Icons.camera_alt),
                    label: Text(
                      hasImage
                          ? 'Tukar'
                          : 'Kamera',
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onGalleryPressed,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Galeri'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}