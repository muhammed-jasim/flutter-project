
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/mock_data.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:my_app/ui/widgets/loan_card.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildMonthlyOutgoingsCard(),
              const SizedBox(height: 24),
              _buildSectionHeader('Upcoming Dues', onSeeAll: () {}),
              const SizedBox(height: 16),
              _buildUpcomingDuesList(),
              const SizedBox(height: 24),
              _buildSectionHeader('Quick Recharges'),
              const SizedBox(height: 16),
              _buildQuickRecharges(),
              const SizedBox(height: 24),
              _buildSectionHeader('Recent Activity', onSeeAll: () {}),
              const SizedBox(height: 16),
              _buildRecentActivityList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back,', style: AppTheme.bodyMedium),
            Text('Alex Rivera', style: AppTheme.headlineMedium),
          ],
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
        ),
      ],
    );
  }

  Widget _buildMonthlyOutgoingsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: AppTheme.primaryCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Monthly Outgoings',
                style: GoogleFonts.inter(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: Text('MARCH', style: GoogleFonts.inter(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '\$2,840.00 ', style: GoogleFonts.inter(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                TextSpan(text: '/ \$3,500', style: GoogleFonts.inter(color: Colors.white.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Budget Utilization', style: GoogleFonts.inter(color: Colors.white.withOpacity(0.8), fontSize: 12)),
              Text('81%', style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(value: 0.81, backgroundColor: Colors.white.withOpacity(0.2), valueColor: const AlwaysStoppedAnimation<Color>(Colors.white), minHeight: 6),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, {VoidCallback? onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTheme.titleLarge),
        if (onSeeAll != null) TextButton(onPressed: onSeeAll, child: Text('VIEW ALL', style: AppTheme.labelSmall.copyWith(color: AppTheme.primaryBlue))),
      ],
    );
  }

  Widget _buildUpcomingDuesList() {
    return Column(
      children: mockLoans.take(3).map((loan) => LoanCard(loan: loan, isDetailed: false)).toList(),
    );
  }

  Widget _buildQuickRecharges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRechargeIcon(Icons.phone_iphone, 'Mobile'),
        _buildRechargeIcon(Icons.tv, 'DTH'),
        _buildRechargeIcon(Icons.directions_car, 'Fastag'),
        _buildRechargeIcon(Icons.lightbulb, 'Utility'),
      ],
    );
  }

  Widget _buildRechargeIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: AppTheme.cardDecoration.copyWith(borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, color: AppTheme.primaryBlue, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTheme.labelSmall),
      ],
    );
  }

  Widget _buildRecentActivityList() {
    return Column(
      children: mockTransactions.take(3).map((tx) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: AppTheme.cardDecoration.copyWith(borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppTheme.backgroundLight, borderRadius: BorderRadius.circular(12)), child: Icon(tx.icon, size: 20, color: AppTheme.textDark)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(tx.title, style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)), const SizedBox(height: 4), Text(tx.subtitle, style: AppTheme.labelSmall)]),
              ),
              Text('${tx.amount > 0 ? '+' : ''}\$${tx.amount.abs().toStringAsFixed(2)}', style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: tx.amount > 0 ? AppTheme.successGreen : (tx.isSuccess ? AppTheme.textDark : AppTheme.errorRed))),
            ],
          ),
        );
      }).toList(),
    );
  }
}
