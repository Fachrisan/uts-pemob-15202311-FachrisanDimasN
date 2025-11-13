import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BiodataFragment extends StatefulWidget {
  const BiodataFragment({super.key});

  @override
  State<BiodataFragment> createState() => _BiodataFragmentState();
}

class _BiodataFragmentState extends State<BiodataFragment> {
  // Data yang ditampilkan
  String nama = 'Fachrisan Dimas N';
  String nim = '152023111';
  String email = 'fachrisan@gmail.com';
  String jenisKelamin = 'Laki-laki';
  String pendidikan = 'S1 - Teknik Informatika';
  DateTime tanggalLahir = DateTime(2003, 5, 15);
  String alamat = 'Bandung, Jawa Barat';
  String noHp = '+62 812-3456-7890';

  bool isEditing = false;

  // Controllers untuk edit mode
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _emailController;
  late TextEditingController _alamatController;
  late TextEditingController _noHpController;
  late String _jenisKelaminTemp;
  late String _pendidikanTemp;
  late DateTime _tanggalLahirTemp;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _namaController = TextEditingController(text: nama);
    _nimController = TextEditingController(text: nim);
    _emailController = TextEditingController(text: email);
    _alamatController = TextEditingController(text: alamat);
    _noHpController = TextEditingController(text: noHp);
    _jenisKelaminTemp = jenisKelamin;
    _pendidikanTemp = pendidikan;
    _tanggalLahirTemp = tanggalLahir;
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    _noHpController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalLahirTemp,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1A1A1A),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _tanggalLahirTemp) {
      setState(() {
        _tanggalLahirTemp = picked;
      });
    }
  }

  void _toggleEditMode() {
    setState(() {
      if (isEditing) {
        // Cancel edit - reset values
        _initControllers();
      }
      isEditing = !isEditing;
    });
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        nama = _namaController.text;
        nim = _nimController.text;
        email = _emailController.text;
        alamat = _alamatController.text;
        noHp = _noHpController.text;
        jenisKelamin = _jenisKelaminTemp;
        pendidikan = _pendidikanTemp;
        tanggalLahir = _tanggalLahirTemp;
        isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 12),
              Text('Data berhasil diperbarui'),
            ],
          ),
          backgroundColor: const Color(0xFF2E7D32),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header - Clean & Professional
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1A1A1A),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  // Avatar
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=${Uri.encodeComponent(nama)}&size=200&background=4A5568&color=fff&bold=true',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'NIM: $nim',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // Edit Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _toggleEditMode,
                    icon: Icon(
                        isEditing ? Icons.close_rounded : Icons.edit_outlined),
                    label: Text(isEditing ? 'Batal' : 'Edit Biodata'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isEditing
                          ? const Color(0xFFD32F2F)
                          : const Color(0xFF1A1A1A),
                      side: BorderSide(
                        color: isEditing
                            ? const Color(0xFFD32F2F)
                            : Colors.grey.shade300,
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                if (isEditing) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _saveData,
                      icon: const Icon(Icons.check_rounded),
                      label: const Text('Simpan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Content
          isEditing ? _buildEditMode() : _buildViewMode(),
        ],
      ),
    );
  }

  Widget _buildViewMode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi Pribadi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoCard(
            icon: Icons.email_outlined,
            label: 'Email',
            value: email,
            color: const Color(0xFF1976D2),
          ),
          _buildInfoCard(
            icon: Icons.phone_outlined,
            label: 'No. Handphone',
            value: noHp,
            color: const Color(0xFF388E3C),
          ),
          _buildInfoCard(
            icon: Icons.person_outline_rounded,
            label: 'Jenis Kelamin',
            value: jenisKelamin,
            color: const Color(0xFF7B1FA2),
          ),
          _buildInfoCard(
            icon: Icons.cake_outlined,
            label: 'Tanggal Lahir',
            value: DateFormat('dd MMMM yyyy').format(tanggalLahir),
            color: const Color(0xFFF57C00),
          ),
          _buildInfoCard(
            icon: Icons.school_outlined,
            label: 'Pendidikan',
            value: pendidikan,
            color: const Color(0xFF0288D1),
          ),
          _buildInfoCard(
            icon: Icons.location_on_outlined,
            label: 'Alamat',
            value: alamat,
            color: const Color(0xFFD32F2F),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 22),
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
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
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

  Widget _buildEditMode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Informasi Pribadi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField(
              controller: _namaController,
              label: 'Nama Lengkap',
              icon: Icons.person_outline_rounded,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama tidak boleh kosong';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _nimController,
              label: 'NIM',
              icon: Icons.badge_outlined,
              keyboardType: TextInputType.number,
            ),
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                if (!value.contains('@')) {
                  return 'Email tidak valid';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: _noHpController,
              label: 'No. Handphone',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),

            // Jenis Kelamin
            const SizedBox(height: 8),
            Text(
              'Jenis Kelamin',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _jenisKelaminTemp = 'Laki-laki';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: _jenisKelaminTemp == 'Laki-laki'
                            ? const Color(0xFF1A1A1A)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _jenisKelaminTemp == 'Laki-laki'
                              ? const Color(0xFF1A1A1A)
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male_rounded,
                            color: _jenisKelaminTemp == 'Laki-laki'
                                ? Colors.white
                                : Colors.grey.shade600,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Laki-laki',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: _jenisKelaminTemp == 'Laki-laki'
                                  ? Colors.white
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _jenisKelaminTemp = 'Perempuan';
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: _jenisKelaminTemp == 'Perempuan'
                            ? const Color(0xFF1A1A1A)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _jenisKelaminTemp == 'Perempuan'
                              ? const Color(0xFF1A1A1A)
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female_rounded,
                            color: _jenisKelaminTemp == 'Perempuan'
                                ? Colors.white
                                : Colors.grey.shade600,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Perempuan',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: _jenisKelaminTemp == 'Perempuan'
                                  ? Colors.white
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tanggal Lahir
            Text(
              'Tanggal Lahir',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () => _selectDate(context),
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300, width: 1.5),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xFF1A1A1A),
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      DateFormat('dd MMMM yyyy').format(_tanggalLahirTemp),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Pendidikan
            Text(
              'Pendidikan',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _pendidikanTemp,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.school_outlined,
                  color: Color(0xFF1A1A1A),
                  size: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF1A1A1A),
                    width: 2,
                  ),
                ),
              ),
              items: [
                'SMA/SMK',
                'D3 - Diploma',
                'S1 - Teknik Informatika',
                'S1 - Sistem Informasi',
                'S2 - Magister',
                'S3 - Doktor',
              ]
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _pendidikanTemp = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            _buildTextField(
              controller: _alamatController,
              label: 'Alamat',
              icon: Icons.location_on_outlined,
              maxLines: 2,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: validator,
            maxLines: maxLines,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(icon, color: const Color(0xFF1A1A1A), size: 20),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFF1A1A1A),
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFD32F2F),
                  width: 1.5,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xFFD32F2F),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
