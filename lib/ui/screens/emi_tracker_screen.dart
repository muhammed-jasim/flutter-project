
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/mock_data.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:my_app/ui/widgets/loan_card.dart';

class EMITrackerScreen extends StatelessWidget {
  const EMITrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalOutstanding = 0;
    double monthlyEMI = 0;
    for (var loan in mockLoans) {
      totalOutstanding += loan.remainingAmount;
      monthlyEMI += loan.nextEmiAmount;
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: Text('EMI Tracker', style: AppTheme.headlineMedium),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz, color: AppTheme.textDark)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildSummaryCard(totalOutstanding, monthlyEMI),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your Active Loans', style: AppTheme.titleLarge),
                TextButton(
                  onPressed: () {},
                  child: Text('View History', style: AppTheme.labelSmall.copyWith(color: AppTheme.primaryBlue)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...mockLoans.map((loan) => LoanCard(loan: loan, isDetailed: true)),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(double totalOutstanding, double monthlyEMI) {
    final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: AppTheme.primaryCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Outstanding Debt',
            style: GoogleFonts.inter(color: Colors.white.withOpacity(0.9), fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            currencyFormat.format(totalOutstanding),
            style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Icon(Icons.trending_down, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Text('2.4% decrease', style: GoogleFonts.inter(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ACTIVE LOANS', style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                      const SizedBox(height: 8),
                      Text('${mockLoans.length < 10 ? '0' : ''}${mockLoans.length}', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      Align(alignment: Alignment.bottomRight, child: Icon(Icons.account_balance, color: Colors.white.withOpacity(0.2), size: 24)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MONTHLY EMIS', style: GoogleFonts.inter(color: Colors.white.withOpacity(0.6), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                      const SizedBox(height: 8),
                      Text('\$${monthlyEMI.toInt()}', style: GoogleFonts.inter(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                       Align(alignment: Alignment.bottomRight, child: Icon(Icons.calendar_today, color: Colors.white.withOpacity(0.2), size: 24)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
