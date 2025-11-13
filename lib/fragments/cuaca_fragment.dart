import 'package:flutter/material.dart';

class WeatherData {
  final String city;
  final String country;
  final int temp;
  final String condition;
  final IconData icon;
  final int humidity;
  final int windSpeed;
  final int visibility;
  final int pressure;
  final int uvIndex;
  final String sunrise;
  final String sunset;

  WeatherData({
    required this.city,
    required this.country,
    required this.temp,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.pressure,
    required this.uvIndex,
    required this.sunrise,
    required this.sunset,
  });
}

class CuacaFragment extends StatefulWidget {
  const CuacaFragment({super.key});

  @override
  State<CuacaFragment> createState() => _CuacaFragmentState();
}

class _CuacaFragmentState extends State<CuacaFragment> {
  int _selectedCityIndex = 0;

  final List<WeatherData> cities = [
    WeatherData(
      city: 'Bandung',
      country: 'Indonesia',
      temp: 28,
      condition: 'Cerah Berawan',
      icon: Icons.wb_sunny,
      humidity: 65,
      windSpeed: 12,
      visibility: 10,
      pressure: 1013,
      uvIndex: 7,
      sunrise: '05:45',
      sunset: '18:15',
    ),
    WeatherData(
      city: 'Jakarta',
      country: 'Indonesia',
      temp: 32,
      condition: 'Panas',
      icon: Icons.wb_sunny,
      humidity: 70,
      windSpeed: 15,
      visibility: 8,
      pressure: 1012,
      uvIndex: 9,
      sunrise: '05:50',
      sunset: '18:10',
    ),
    WeatherData(
      city: 'Surabaya',
      country: 'Indonesia',
      temp: 31,
      condition: 'Berawan',
      icon: Icons.wb_cloudy,
      humidity: 68,
      windSpeed: 18,
      visibility: 9,
      pressure: 1011,
      uvIndex: 8,
      sunrise: '05:40',
      sunset: '18:05',
    ),
    WeatherData(
      city: 'Yogyakarta',
      country: 'Indonesia',
      temp: 29,
      condition: 'Cerah',
      icon: Icons.wb_sunny,
      humidity: 60,
      windSpeed: 10,
      visibility: 12,
      pressure: 1014,
      uvIndex: 7,
      sunrise: '05:48',
      sunset: '18:12',
    ),
    WeatherData(
      city: 'Bali',
      country: 'Indonesia',
      temp: 30,
      condition: 'Cerah',
      icon: Icons.wb_sunny,
      humidity: 72,
      windSpeed: 14,
      visibility: 10,
      pressure: 1010,
      uvIndex: 10,
      sunrise: '06:00',
      sunset: '18:20',
    ),
  ];

  WeatherData get currentWeather => cities[_selectedCityIndex];

  void _showCitySelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Pilih Kota',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                final isSelected = _selectedCityIndex == index;
                return ListTile(
                  leading: Icon(
                    Icons.location_city_rounded,
                    color: isSelected ? const Color(0xFF1A1A1A) : Colors.grey,
                  ),
                  title: Text(
                    city.city,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                      color:
                          isSelected ? const Color(0xFF1A1A1A) : Colors.black,
                    ),
                  ),
                  subtitle: Text('${city.temp}°C • ${city.condition}'),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle_rounded,
                          color: Color(0xFF1A1A1A))
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedCityIndex = index;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade600,
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Location Header
              GestureDetector(
                onTap: _showCitySelector,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(Icons.location_on_rounded,
                          color: Colors.white, size: 18),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${currentWeather.city}, ${currentWeather.country}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.keyboard_arrow_down_rounded,
                          color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Weather Icon
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  currentWeather.icon,
                  size: 90,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Temperature
              Text(
                '${currentWeather.temp}°',
                style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  height: 1,
                ),
              ),

              const SizedBox(height: 8),

              // Condition
              Text(
                currentWeather.condition,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 30),

              // Main Weather Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: _buildMainStat(
                          Icons.water_drop_outlined,
                          '${currentWeather.humidity}%',
                          'Kelembapan',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      Expanded(
                        child: _buildMainStat(
                          Icons.air_rounded,
                          '${currentWeather.windSpeed}',
                          'km/h',
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      Expanded(
                        child: _buildMainStat(
                          Icons.visibility_outlined,
                          '${currentWeather.visibility}',
                          'km',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Detail Cards Grid - FIXED
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailCard(
                            Icons.compress_rounded,
                            'Tekanan',
                            '${currentWeather.pressure}',
                            'mb',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDetailCard(
                            Icons.wb_sunny_outlined,
                            'UV Index',
                            '${currentWeather.uvIndex}',
                            'Tinggi',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildDetailCard(
                            Icons.wb_twilight_rounded,
                            'Terbit',
                            currentWeather.sunrise,
                            'AM',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDetailCard(
                            Icons.nightlight_outlined,
                            'Terbenam',
                            currentWeather.sunset,
                            'PM',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Hourly Forecast
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.schedule_rounded,
                            color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Prakiraan Per Jam',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildHourlyCard('Sekarang', currentWeather.icon,
                              '${currentWeather.temp}°'),
                          _buildHourlyCard('13:00', Icons.wb_sunny_rounded,
                              '${currentWeather.temp + 2}°'),
                          _buildHourlyCard('15:00', Icons.wb_cloudy_rounded,
                              '${currentWeather.temp + 3}°'),
                          _buildHourlyCard('17:00', Icons.cloud_rounded,
                              '${currentWeather.temp + 1}°'),
                          _buildHourlyCard('19:00', Icons.nights_stay_rounded,
                              '${currentWeather.temp - 2}°'),
                          _buildHourlyCard('21:00', Icons.nights_stay_rounded,
                              '${currentWeather.temp - 4}°'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Weekly Forecast
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.calendar_today_rounded,
                            color: Colors.white, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Prakiraan 7 Hari',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    _buildDailyCard('Sen', Icons.wb_sunny_rounded,
                        currentWeather.temp + 3, currentWeather.temp - 2, 80),
                    _buildDailyCard('Sel', Icons.wb_cloudy_rounded,
                        currentWeather.temp + 2, currentWeather.temp - 1, 60),
                    _buildDailyCard('Rab', Icons.cloud_rounded,
                        currentWeather.temp, currentWeather.temp - 3, 40),
                    _buildDailyCard('Kam', Icons.grain_rounded,
                        currentWeather.temp - 2, currentWeather.temp - 4, 90),
                    _buildDailyCard('Jum', Icons.wb_sunny_rounded,
                        currentWeather.temp + 1, currentWeather.temp - 2, 70),
                    _buildDailyCard('Sab', Icons.wb_cloudy_rounded,
                        currentWeather.temp, currentWeather.temp - 1, 50),
                    _buildDailyCard('Min', Icons.wb_sunny_rounded,
                        currentWeather.temp + 2, currentWeather.temp - 2, 65),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainStat(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDetailCard(
      IconData icon, String title, String value, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white.withOpacity(0.9), size: 16),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 11,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 10,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyCard(String time, IconData icon, String temp) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Icon(icon, color: Colors.white, size: 26),
          const SizedBox(height: 10),
          Text(
            temp,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyCard(
      String day, IconData icon, int maxTemp, int minTemp, int humidity) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 35,
            child: Text(
              day,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.water_drop_outlined,
                  size: 10,
                  color: Colors.white.withOpacity(0.9),
                ),
                const SizedBox(width: 2),
                Text(
                  '$humidity%',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Flexible(
            fit: FlexFit.loose,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 40,
                  height: 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade200,
                        Colors.orange.shade300,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$maxTemp°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$minTemp°',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
