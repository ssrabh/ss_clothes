import 'package:female_clothes/provider/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  // Define available options (consistent with your previous logic)
  final List<String> availableSizes = ["S", "M", "L", "XL", "Free Size"];
  final List<String> availableColors = [
    "Red",
    "Pink",
    "Green",
    "Blue",
    "White",
    "Black"
  ];
  // Map color names to actual Color objects
  final Map<String, Color> colorMap = {
    "Red": Colors.red,
    "Pink": Colors.pink,
    "Green": Colors.green,
    "Blue": Colors.blue,
    "White": Colors.white,
    "Black": Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    final fp = Provider.of<FilterProvider>(context);
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      appBar: AppBar(
        title: Text("Refine Your Style",
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: fp.resetFilters,
            child: const Text("Reset All",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
        ],
      ),

      // Use a custom bottom bar for persistent actions
      bottomNavigationBar: _buildBottomActions(context, theme),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 800), // Max width for content on desktop
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- 1. Price Range Filter ---
                _buildSectionTitle(context, 'Price Range (₹0 - ₹5000)'),
                _buildPriceSlider(fp, theme),

                const SizedBox(height: 30),

                // --- 2. Size Filter ---
                _buildSectionTitle(context, 'Size'),
                _buildSizeSelector(fp, theme),

                const SizedBox(height: 30),

                // --- 3. Color Filter ---
                _buildSectionTitle(context, 'Color'),
                _buildColorSelector(fp, theme),

                const SizedBox(height: 30),

                // --- 4. Height Filter (Using simple inputs for demonstration) ---
                if (!isWide) ...[
                  _buildSectionTitle(context, 'Height Range (cm)'),
                  _buildHeightInputs(fp),
                ],

                // Add padding for scroll safety above the bottom bar
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildPriceSlider(FilterProvider fp, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Min: ₹${fp.minPrice.round()}',
                  style: theme.textTheme.titleMedium),
              Text('Max: ₹${fp.maxPrice.round()}',
                  style: theme.textTheme.titleMedium),
            ],
          ),
        ),
        RangeSlider(
          min: 0,
          max: 5000,
          divisions: 50,
          activeColor: theme.colorScheme.primary,
          values: RangeValues(fp.minPrice, fp.maxPrice),
          onChanged: (v) => fp.updatePriceRange(v.start, v.end),
        ),
      ],
    );
  }

  Widget _buildSizeSelector(FilterProvider fp, ThemeData theme) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: availableSizes.map((size) {
        final isSelected = size == fp.selectedSize;
        return ActionChip(
          label: Text(size,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color:
                      isSelected ? Colors.white : theme.colorScheme.onSurface)),
          avatar: isSelected
              ? const Icon(Icons.check, size: 18, color: Colors.white)
              : null,
          backgroundColor: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
                color: isSelected
                    ? theme.colorScheme.primary
                    : Colors.transparent),
          ),
          onPressed: () {
            // Toggle selection
            fp.setSize(isSelected ? null : size);
          },
        );
      }).toList(),
    );
  }

  Widget _buildColorSelector(FilterProvider fp, ThemeData theme) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: availableColors.map((colorName) {
        final color = colorMap[colorName] ?? Colors.transparent;
        final isSelected = colorName == fp.selectedColor;
        final isLight = color.computeLuminance() > 0.5;

        return GestureDetector(
          onTap: () {
            fp.setColor(isSelected ? null : colorName);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? theme.colorScheme.primary
                    : Colors.grey.shade300,
                width: isSelected ? 4 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: theme.colorScheme.primary.withOpacity(0.4),
                        blurRadius: 8,
                      )
                    ]
                  : null,
            ),
            child: isSelected
                ? Center(
                    child: Icon(Icons.check,
                        size: 20, color: isLight ? Colors.black : Colors.white),
                  )
                : null,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildHeightInputs(FilterProvider fp) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Min Height',
              hintText: 'e.g., 150 cm',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (text) {
              final min = double.tryParse(text);
              fp.updateHeight(min, fp.maxHeight);
            },
            // Set initial value
            controller:
                TextEditingController(text: fp.minHeight?.toString() ?? ''),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Max Height',
              hintText: 'e.g., 180 cm',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (text) {
              final max = double.tryParse(text);
              fp.updateHeight(fp.minHeight, max);
            },
            // Set initial value
            controller:
                TextEditingController(text: fp.maxHeight?.toString() ?? ''),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActions(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border:
            Border(top: BorderSide(color: Colors.grey.shade200, width: 1.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Provider.of<FilterProvider>(context, listen: false)
                      .resetFilters();
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(
                      color: theme.colorScheme.primary.withOpacity(0.5)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Reset',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // This applies the filter by closing the screen, allowing the HomeProvider to read the FilterProvider state.
                  context.pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Show Results',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
