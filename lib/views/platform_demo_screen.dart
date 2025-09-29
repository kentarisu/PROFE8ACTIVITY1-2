import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class PlatformDemoScreen extends StatefulWidget {
  const PlatformDemoScreen({super.key});

  @override
  State<PlatformDemoScreen> createState() => _PlatformDemoScreenState();
}

class _PlatformDemoScreenState extends State<PlatformDemoScreen> {
  bool _materialSwitchValue = false;
  bool _cupertinoSwitchValue = false;
  double _materialSliderValue = 50.0;
  double _cupertinoSliderValue = 50.0;
  String _selectedVideoQuality = 'HD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Platform Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPlatformHeader(),
            const SizedBox(height: 24),
            _buildButtonComparison(),
            const SizedBox(height: 24),
            _buildSwitchComparison(),
            const SizedBox(height: 24),
            _buildSliderComparison(),
            const SizedBox(height: 24),
            _buildDialogComparison(),
            const SizedBox(height: 24),
            _buildPickerComparison(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformHeader() {
    String platformInfo;
    if (kIsWeb) {
      platformInfo = 'Web Platform - Material Design Optimized';
    } else if (!kIsWeb && Platform.isIOS) {
      platformInfo = 'iOS Platform - Cupertino Design Native';
    } else if (!kIsWeb && Platform.isAndroid) {
      platformInfo = 'Android Platform - Material Design Native';
    } else {
      platformInfo = 'Desktop Platform - Material Design Adapted';
    }

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  kIsWeb
                      ? Icons.web
                      : (Platform.isIOS
                          ? Icons.phone_iphone
                          : Icons.phone_android),
                  color: Colors.deepPurple,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    platformInfo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Material Design vs Cupertino widgets comparison',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonComparison() {
    return _buildComparisonSection(
      'Buttons - Video Controls',
      Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Text('Material Design',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        _showMaterialSnackBar('Material video export started!'),
                    icon: const Icon(Icons.video_file, size: 16),
                    label: const Text('Export', style: TextStyle(fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 60, color: Colors.grey[300]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                const Text('Cupertino Design',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    onPressed: () =>
                        _showCupertinoDialog('Cupertino video export started!'),
                    child: const Text('Export', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchComparison() {
    return _buildComparisonSection(
      'Switches - Video Settings',
      Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Text('Material Design',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.save, size: 16),
                    const SizedBox(width: 8),
                    const Expanded(
                        child:
                            Text('Auto-save', style: TextStyle(fontSize: 12))),
                    Switch(
                      value: _materialSwitchValue,
                      onChanged: (value) =>
                          setState(() => _materialSwitchValue = value),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(width: 1, height: 80, color: Colors.grey[300]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                const Text('Cupertino Design',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(CupertinoIcons.floppy_disk, size: 16),
                    const SizedBox(width: 8),
                    const Expanded(
                        child:
                            Text('Auto-save', style: TextStyle(fontSize: 12))),
                    CupertinoSwitch(
                      value: _cupertinoSwitchValue,
                      onChanged: (value) =>
                          setState(() => _cupertinoSwitchValue = value),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderComparison() {
    return _buildComparisonSection(
      'Sliders - Video Quality Control',
      Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('Material Design',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 8),
                    Slider(
                      value: _materialSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 4,
                      label: '${_materialSliderValue.round()}%',
                      onChanged: (value) =>
                          setState(() => _materialSliderValue = value),
                    ),
                    Text('${_materialSliderValue.round()}%',
                        style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    const Text('Cupertino Design',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                    const SizedBox(height: 8),
                    CupertinoSlider(
                      value: _cupertinoSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 4,
                      onChanged: (value) =>
                          setState(() => _cupertinoSliderValue = value),
                    ),
                    Text('${_cupertinoSliderValue.round()}%',
                        style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDialogComparison() {
    return _buildComparisonSection(
      'Dialogs - Video Export Confirmation',
      Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: _showMaterialDialog,
              child:
                  const Text('Material Dialog', style: TextStyle(fontSize: 12)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CupertinoButton.filled(
              onPressed: _showCupertinoActionSheet,
              child:
                  const Text('Cupertino Sheet', style: TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickerComparison() {
    return _buildComparisonSection(
      'Pickers - Video Format Selection',
      Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: _selectedVideoQuality,
              isExpanded: true,
              items: ['HD', '4K', '8K'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('$value Quality',
                      style: const TextStyle(fontSize: 12)),
                );
              }).toList(),
              onChanged: (value) =>
                  setState(() => _selectedVideoQuality = value!),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CupertinoButton(
              onPressed: _showCupertinoPicker,
              child: Text('$_selectedVideoQuality Quality',
                  style: const TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonSection(String title, Widget content) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }

  void _showMaterialSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: 'OK', onPressed: () {}),
      ),
    );
  }

  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Video'),
        content: const Text('Ready to export?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Export')),
        ],
      ),
    );
  }

  void _showCupertinoDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Video Export'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  void _showCupertinoActionSheet() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Export Options'),
        message: const Text('Choose format'),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('MP4'),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoActionSheetAction(
            child: const Text('MOV'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  void _showCupertinoPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 250,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoButton(
                  child: const Text('Done'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Expanded(
              child: CupertinoPicker(
                itemExtent: 40,
                onSelectedItemChanged: (index) {
                  setState(
                      () => _selectedVideoQuality = ['HD', '4K', '8K'][index]);
                },
                children: ['HD', '4K', '8K']
                    .map((quality) => Center(child: Text('$quality Quality')))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
