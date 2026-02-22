
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        title: Text('Profile', style: AppTheme.headlineMedium),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, color: AppTheme.textDark),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 32),
            _buildSectionHeader('General'),
            const SizedBox(height: 16),
            _buildMenuItem(Icons.person_outline, 'Personal Information', 'Name, Email'),
            _buildMenuItem(Icons.credit_card, 'Payment Methods', 'Visa, MasterCard'),
            _buildMenuItem(Icons.notifications_none, 'Notifications', 'On'),
            const SizedBox(height: 32),
            _buildSectionHeader('Security & Support'),
            const SizedBox(height: 16),
            _buildMenuItem(Icons.lock_outline, 'Security', 'Password, FaceID'),
            _buildMenuItem(Icons.help_outline, 'Help & Support', 'FAQ, Contact Us'),
            _buildMenuItem(Icons.policy_outlined, 'Privacy Policy', ''),
            const SizedBox(height: 32),
            _buildLogoutButton(),
             const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               border: Border.all(color: Colors.white, width: 4),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.1),
                   blurRadius: 20,
                   offset: const Offset(0, 10),
                 )
               ] 
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text('Alex Rivera', style: AppTheme.headlineMedium),
        const SizedBox(height: 4),
        Text('alex.rivera@example.com', style: AppTheme.bodyMedium),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryBlue.withOpacity(0.1),
            foregroundColor: AppTheme.primaryBlue,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          ),
          child: const Text('Edit Profile'),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppTheme.textGrey,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.cardDecoration,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.backgroundLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppTheme.primaryBlue, size: 22),
        ),
        title: Text(title, style: AppTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: AppTheme.textDark)),
        subtitle: subtitle.isNotEmpty ? Text(subtitle, style: AppTheme.labelSmall) : null,
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: AppTheme.errorRed.withOpacity(0.2)),
          ),
        ),
        child: Text(
          'Log Out',
          style: GoogleFonts.inter(
            color: AppTheme.errorRed,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
