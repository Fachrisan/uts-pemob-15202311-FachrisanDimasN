import 'package:flutter/material.dart';

class Contact {
  final String id;
  String name;
  String phone;
  String email;
  String initial;
  final Color color;
  bool isFavorite;
  String lastSeen;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.initial,
    required this.color,
    this.isFavorite = false,
    required this.lastSeen,
  });
}

class KontakFragment extends StatefulWidget {
  const KontakFragment({super.key});

  @override
  State<KontakFragment> createState() => _KontakFragmentState();
}

class _KontakFragmentState extends State<KontakFragment> {
  String _searchQuery = '';
  bool _showFavorites = false;

  final List<Contact> contacts = [
    Contact(
      id: '1',
      name: 'Ahmad Fauzi',
      phone: '081234567890',
      email: 'ahmad.fauzi@email.com',
      initial: 'AF',
      color: const Color(0xFF1A1A1A),
      isFavorite: true,
      lastSeen: 'Online',
    ),
    Contact(
      id: '2',
      name: 'Budi Santoso',
      phone: '081234567891',
      email: 'budi.santoso@email.com',
      initial: 'BS',
      color: const Color(0xFF1A1A1A),
      isFavorite: true,
      lastSeen: '5 menit lalu',
    ),
    Contact(
      id: '3',
      name: 'Citra Dewi',
      phone: '081234567892',
      email: 'citra.dewi@email.com',
      initial: 'CD',
      color: const Color(0xFF1A1A1A),
      lastSeen: '1 jam lalu',
    ),
    Contact(
      id: '4',
      name: 'Dedi Kurniawan',
      phone: '081234567893',
      email: 'dedi.k@email.com',
      initial: 'DK',
      color: const Color(0xFF1A1A1A),
      lastSeen: 'Online',
    ),
    Contact(
      id: '5',
      name: 'Eka Putri',
      phone: '081234567894',
      email: 'eka.putri@email.com',
      initial: 'EP',
      color: const Color(0xFF1A1A1A),
      isFavorite: true,
      lastSeen: '2 jam lalu',
    ),
  ];

  List<Contact> get filteredContacts {
    var filtered = contacts;

    if (_showFavorites) {
      filtered = filtered.where((c) => c.isFavorite).toList();
    }

    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((contact) =>
              contact.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              contact.phone.contains(_searchQuery))
          .toList();
    }

    return filtered;
  }

  void _addContact() async {
    final result = await showDialog<Contact>(
      context: context,
      builder: (context) => const AddContactDialog(),
    );

    if (result != null) {
      setState(() {
        contacts.add(result);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${result.name} berhasil ditambahkan'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  void _toggleFavorite(Contact contact) {
    setState(() {
      contact.isFavorite = !contact.isFavorite;
    });
  }

  void _deleteContact(Contact contact) {
    setState(() {
      contacts.removeWhere((c) => c.id == contact.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${contact.name} dihapus'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Compact
        Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: Column(
            children: [
              // Search Bar - Compact
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Cari kontak...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey.shade500,
                      size: 18,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Filter tabs
              Row(
                children: [
                  _buildFilterChip(
                    'Semua',
                    !_showFavorites,
                    () => setState(() => _showFavorites = false),
                  ),
                  const SizedBox(width: 8),
                  _buildFilterChip(
                    'Favorit',
                    _showFavorites,
                    () => setState(() => _showFavorites = true),
                  ),
                  const Spacer(),
                  // Tombol Tambah Kontak
                  GestureDetector(
                    onTap: _addContact,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.add_rounded,
                              color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Tambah',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Contact List
        Expanded(
          child: filteredContacts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_search_rounded,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Kontak tidak ditemukan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  itemCount: filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = filteredContacts[index];
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactDetailScreen(
                                contact: contact,
                                onToggleFavorite: () =>
                                    _toggleFavorite(contact),
                                onDelete: () => _deleteContact(contact),
                              ),
                            ),
                          );
                          if (result == 'refresh') {
                            setState(() {});
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade100,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              // Avatar
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    contact.initial,
                                    style: const TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Name & info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            contact.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                              color: Color(0xFF1A1A1A),
                                            ),
                                          ),
                                        ),
                                        if (contact.isFavorite)
                                          const Icon(
                                            Icons.star_rounded,
                                            size: 16,
                                            color: Color(0xFFFFA000),
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      children: [
                                        if (contact.lastSeen == 'Online')
                                          Container(
                                            width: 6,
                                            height: 6,
                                            margin:
                                                const EdgeInsets.only(right: 6),
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF4CAF50),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        Text(
                                          contact.lastSeen,
                                          style: TextStyle(
                                            color: contact.lastSeen == 'Online'
                                                ? const Color(0xFF4CAF50)
                                                : Colors.grey.shade600,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.grey.shade400,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1A1A1A) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? const Color(0xFF1A1A1A) : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}

// Dialog Tambah Kontak
class AddContactDialog extends StatefulWidget {
  const AddContactDialog({super.key});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tambah Kontak Baru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.person_rounded),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Nomor Telepon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.phone_rounded),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.email_rounded),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email harus diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final name = _nameController.text;
                        final initial = name
                            .split(' ')
                            .map((e) => e.isNotEmpty ? e[0] : '')
                            .take(2)
                            .join()
                            .toUpperCase();

                        final contact = Contact(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: name,
                          phone: _phoneController.text,
                          email: _emailController.text,
                          initial: initial,
                          color: const Color(0xFF1A1A1A),
                          lastSeen: 'Offline',
                        );

                        Navigator.pop(context, contact);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A1A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

// Halaman Detail Kontak
class ContactDetailScreen extends StatelessWidget {
  final Contact contact;
  final VoidCallback onToggleFavorite;
  final VoidCallback onDelete;

  const ContactDetailScreen({
    super.key,
    required this.contact,
    required this.onToggleFavorite,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.pop(context, 'refresh'),
        ),
        title: const Text(
          'Detail Kontak',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              contact.isFavorite
                  ? Icons.star_rounded
                  : Icons.star_border_rounded,
              color: contact.isFavorite
                  ? const Color(0xFFFFA000)
                  : const Color(0xFF1A1A1A),
            ),
            onPressed: () {
              onToggleFavorite();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    contact.isFavorite
                        ? 'Ditambahkan ke favorit'
                        : 'Dihapus dari favorit',
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert_rounded, color: Color(0xFF1A1A1A)),
            onSelected: (value) {
              if (value == 'delete') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Hapus Kontak'),
                    content: Text('Yakin ingin menghapus ${contact.name}?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, 'refresh');
                          onDelete();
                        },
                        child: const Text(
                          'Hapus',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete_rounded, color: Colors.red, size: 20),
                    SizedBox(width: 12),
                    Text('Hapus Kontak', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Profile Section
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  contact.initial,
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              contact.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (contact.lastSeen == 'Online')
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(right: 6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF4CAF50),
                      shape: BoxShape.circle,
                    ),
                  ),
                Text(
                  contact.lastSeen,
                  style: TextStyle(
                    fontSize: 14,
                    color: contact.lastSeen == 'Online'
                        ? const Color(0xFF4CAF50)
                        : Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      icon: Icons.message_rounded,
                      label: 'Pesan',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(contact: contact),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      icon: Icons.phone_rounded,
                      label: 'Telepon',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CallScreen(contact: contact, isVideo: false),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      icon: Icons.videocam_rounded,
                      label: 'Video',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CallScreen(contact: contact, isVideo: true),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Info Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildInfoCard(
                      Icons.phone_rounded, 'Nomor Telepon', contact.phone),
                  _buildInfoCard(Icons.email_rounded, 'Email', contact.email),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF1A1A1A), size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Call Screen
class CallScreen extends StatefulWidget {
  final Contact contact;
  final bool isVideo;

  const CallScreen({super.key, required this.contact, required this.isVideo});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  String callStatus = 'Memanggil...';
  bool isMuted = false;
  bool isSpeaker = false;

  @override
  void initState() {
    super.initState();
    // Simulasi panggilan terhubung
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          callStatus = 'Terhubung';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.contact.initial,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Nama
            Text(
              widget.contact.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            // Status
            Text(
              callStatus,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // Control Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildControlButton(
                    icon: isMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
                    label: isMuted ? 'Unmute' : 'Mute',
                    onTap: () => setState(() => isMuted = !isMuted),
                  ),
                  _buildControlButton(
                    icon: isSpeaker
                        ? Icons.volume_up_rounded
                        : Icons.volume_down_rounded,
                    label: 'Speaker',
                    onTap: () => setState(() => isSpeaker = !isSpeaker),
                  ),
                  if (widget.isVideo)
                    _buildControlButton(
                      icon: Icons.videocam_off_rounded,
                      label: 'Camera',
                      onTap: () {},
                    ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // End Call Button
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.call_end_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Chat
class ChatScreen extends StatefulWidget {
  final Contact contact;

  const ChatScreen({super.key, required this.contact});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'text': _messageController.text,
        'isMe': true,
        'time':
            '${TimeOfDay.now().hour}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
      });
      _messageController.clear();
    });

    // Simulasi balasan otomatis
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _messages.add({
            'text': 'Terima kasih atas pesannya!',
            'isMe': false,
            'time':
                '${TimeOfDay.now().hour}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1A1A1A)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.contact.initial,
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contact.name,
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.contact.lastSeen,
                    style: TextStyle(
                      color: widget.contact.lastSeen == 'Online'
                          ? const Color(0xFF4CAF50)
                          : Colors.grey.shade600,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_rounded, color: Color(0xFF1A1A1A)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CallScreen(contact: widget.contact, isVideo: false),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Mulai percakapan dengan\n${widget.contact.name}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return _buildMessage(
                        message['text'],
                        message['isMe'],
                        message['time'],
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: 'Ketik pesan...',
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1A1A1A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String text, bool isMe, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) const SizedBox(width: 40),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isMe ? const Color(0xFF1A1A1A) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color:
                          isMe ? const Color(0xFF1A1A1A) : Colors.grey.shade200,
                    ),
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: isMe ? Colors.white : const Color(0xFF1A1A1A),
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          if (isMe) const SizedBox(width: 40),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
