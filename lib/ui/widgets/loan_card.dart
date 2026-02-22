
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/mock_data.dart';
import 'package:my_app/theme/app_theme.dart';

class LoanCard extends StatelessWidget {
  final Loan loan;
  final bool isDetailed; // For EMI tracker screen vs Dashboard

  const LoanCard({super.key, required this.loan, this.isDetailed = false});

  @override
  Widget build(BuildContext context) {
    if (!isDetailed) {
      // Compact version for Dashboard
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
                color: loan.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.receipt_long, color: loan.color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(loan.title, style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: AppTheme.textDark)),
                  const SizedBox(height: 4),
                  Text(
                    'Due in ${loan.dueDate.difference(DateTime.now()).inDays} days • ${DateFormat('d MMM').format(loan.dueDate)}',
                    style: AppTheme.labelSmall,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('\$${loan.nextEmiAmount.toStringAsFixed(2)}', style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppTheme.textDark)),
                const SizedBox(height: 8),
                SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('PAY NOW'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // Detailed version for EMI Tracker
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: AppTheme.cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                   Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: loan.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.home, color: loan.color, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(loan.title, style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppTheme.textDark)),
                        Text(loan.bank, style: AppTheme.labelSmall.copyWith(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('${(loan.progress * 100).toInt()}% Paid', style: AppTheme.labelSmall.copyWith(color: AppTheme.primaryBlue, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${loan.paidAmount.toStringAsFixed(0)} PAID', style: AppTheme.labelSmall.copyWith(fontSize: 10)),
                Text('\$${loan.remainingAmount.toStringAsFixed(0)} REMAINING', style: AppTheme.labelSmall.copyWith(fontSize: 10)),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: loan.progress,
                backgroundColor: Colors.grey.shade100,
                valueColor: AlwaysStoppedAnimation<Color>(loan.color),
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailItem('INTEREST', '${loan.interestRate}%'),
                _buildDetailItem('DUE DATE', DateFormat('MMM d').format(loan.dueDate)),
                _buildDetailItem('NEXT EMI', '\$${loan.nextEmiAmount.toStringAsFixed(0)}', isHighlight: true),
              ],
            ),
          ],
        ),
      );
    }
  }

  Widget _buildDetailItem(String label, String value, {bool isHighlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTheme.labelSmall.copyWith(fontSize: 10, color: Colors.grey.shade500)),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTheme.bodyMedium.copyWith(
            fontWeight: FontWeight.bold,
            color: isHighlight ? AppTheme.primaryBlue : AppTheme.textDark,
          ),
        ),
      ],
    );
  }
}
