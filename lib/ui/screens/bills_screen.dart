
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/mock_data.dart';
import 'package:my_app/theme/app_theme.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: Text('Bills & Recharges', style: AppTheme.headlineMedium),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline, color: AppTheme.textDark),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildCategoriesGrid(),
            const SizedBox(height: 24),
            _buildPromoBanner(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Bills', style: AppTheme.titleLarge),
                TextButton(
                  onPressed: () {},
                  child: Text('View History', style: AppTheme.labelSmall.copyWith(color: AppTheme.primaryBlue)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildRecentBillsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search provider or biller',
          hintStyle: AppTheme.bodyMedium.copyWith(color: Colors.grey.shade400),
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: mockCategories.length,
      itemBuilder: (context, index) {
        final category = mockCategories[index];
        return Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(category.icon, color: AppTheme.primaryBlue, size: 24),
            ),
            const SizedBox(height: 8),
            Text(category.name, style: AppTheme.labelSmall.copyWith(fontSize: 10, fontWeight: FontWeight.normal), textAlign: TextAlign.center, maxLines: 1),
          ],
        );
      },
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F36), // Dark navy
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('OFFER', style: GoogleFonts.inter(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                Text('10% Cashback', style: GoogleFonts.inter(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('On utility bill payments above \$50', style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), fontSize: 12)),
              ],
            ),
          ),
          Icon(Icons.savings, color: Colors.white.withOpacity(0.2), size: 64),
        ],
      ),
    );
  }

  Widget _buildRecentBillsList() {
    return Column(
      children: [
        _buildBillItem('State Power Corp', 'Last paid on 12 Oct', 84.50, 'PAY'),
        _buildBillItem('Gigabit Fiber', 'AUTO-PAY ENABLED', 49.00, 'RECHARGE', isAutoPay: true),
        _buildBillItem('SecureLife Insure', 'Due in 2 days', 120.00, 'PAY NOW', isDue: true),
      ],
    );
  }

  Widget _buildBillItem(String title, String subtitle, double amount, String action, {bool isAutoPay = false, bool isDue = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isDue ? AppTheme.errorRed.withOpacity(0.1) : (isAutoPay ? Colors.blue.withOpacity(0.1) : Colors.orange.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isDue ? Icons.warning : (isAutoPay ? Icons.wifi : Icons.lightbulb),
              color: isDue ? AppTheme.errorRed : (isAutoPay ? AppTheme.primaryBlue : Colors.orange),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: AppTheme.textDark)),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTheme.labelSmall.copyWith(color: isDue ? AppTheme.errorRed : (isAutoPay ? AppTheme.successGreen : AppTheme.textGrey))),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('\$${amount.toStringAsFixed(2)}', style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 28,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    backgroundColor: isDue ? AppTheme.errorRed : (isAutoPay ? AppTheme.primaryBlue : Colors.white),
                    foregroundColor: isDue || isAutoPay ? Colors.white : AppTheme.primaryBlue,
                    elevation: 0,
                    side: isDue || isAutoPay ? BorderSide.none : const BorderSide(color: AppTheme.primaryBlue),
                    textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  child: Text(action),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
