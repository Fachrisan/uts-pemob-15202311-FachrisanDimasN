import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _displayText = '0';
  String _expression = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  final List<String> _history = [];

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        _displayText = '0';
        _expression = '';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else if (buttonText == '⌫') {
        if (_displayText.length > 1 && _displayText != 'Error') {
          _displayText = _displayText.substring(0, _displayText.length - 1);
        } else {
          _displayText = '0';
        }
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷' ||
          buttonText == '%') {
        _num1 = double.tryParse(_displayText) ?? 0;
        _operand = buttonText;
        _expression = '$_displayText $buttonText';
        _displayText = '0';
      } else if (buttonText == '=') {
        _num2 = double.tryParse(_displayText) ?? 0;
        double result = 0;

        switch (_operand) {
          case '+':
            result = _num1 + _num2;
            break;
          case '-':
            result = _num1 - _num2;
            break;
          case '×':
            result = _num1 * _num2;
            break;
          case '÷':
            if (_num2 != 0) {
              result = _num1 / _num2;
            } else {
              _displayText = 'Error';
              _expression = '';
              return;
            }
            break;
          case '%':
            result = _num1 % _num2;
            break;
        }

        String calculation = '$_expression $_num2 = ${_formatResult(result)}';
        _history.insert(0, calculation);
        if (_history.length > 10) _history.removeLast();

        _displayText = _formatResult(result);
        _expression = '';
        _operand = '';
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == '√') {
        double num = double.tryParse(_displayText) ?? 0;
        if (num >= 0) {
          double result = sqrt(num);
          _displayText = _formatResult(result);
        } else {
          _displayText = 'Error';
        }
        _expression = '';
      } else if (buttonText == 'x²') {
        double num = double.tryParse(_displayText) ?? 0;
        double result = num * num;
        _displayText = _formatResult(result);
        _expression = '';
      } else if (buttonText == '+/-') {
        if (_displayText != '0' && _displayText != 'Error') {
          if (_displayText.startsWith('-')) {
            _displayText = _displayText.substring(1);
          } else {
            _displayText = '-$_displayText';
          }
        }
      } else {
        if (_displayText == '0' && buttonText != '.') {
          _displayText = buttonText;
        } else if (buttonText == '.' && _displayText.contains('.')) {
          return;
        } else {
          _displayText += buttonText;
        }
      }
    });
  }

  String _formatResult(double result) {
    if (result == result.toInt()) {
      return result.toInt().toString();
    } else {
      String formatted = result.toStringAsFixed(8);
      formatted = formatted.replaceAll(RegExp(r'\.?0+$'), '');
      return formatted;
    }
  }

  Widget _buildButton({
    required String text,
    Color? backgroundColor,
    Color? textColor,
    int flex = 1,
    double fontSize = 20,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Material(
          color: backgroundColor ?? const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(14),
          elevation: 2,
          shadowColor: Colors.black26,
          child: InkWell(
            onTap: () => _buttonPressed(text),
            borderRadius: BorderRadius.circular(14),
            splashColor: Colors.white24,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showHistory() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Riwayat Perhitungan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () {
                      setState(() => _history.clear());
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              Expanded(
                child: _history.isEmpty
                    ? const Center(
                        child: Text(
                          'Belum ada riwayat',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _history.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              _history[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.chevron_right,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF000000), Color(0xFF1C1C1E)],
            ),
          ),
          child: Column(
            children: [
              // Header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kalkulator Pro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.history, color: Colors.white70),
                      onPressed: _showHistory,
                    ),
                  ],
                ),
              ),

              // Display Area
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (_expression.isNotEmpty)
                        Text(
                          _expression,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white54,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 8),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          _displayText,
                          style: const TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            letterSpacing: -1,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Buttons Area
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(children: [
                          _buildButton(
                              text: 'AC',
                              backgroundColor: const Color(0xFFFF453A),
                              textColor: Colors.white),
                          _buildButton(
                              text: '+/-',
                              backgroundColor: const Color(0xFF505052)),
                          _buildButton(
                              text: '%',
                              backgroundColor: const Color(0xFF505052)),
                          _buildButton(
                              text: '÷',
                              backgroundColor: const Color(0xFF0A84FF),
                              textColor: Colors.white),
                        ]),
                      ),
                      Expanded(
                        child: Row(children: [
                          _buildButton(text: '7'),
                          _buildButton(text: '8'),
                          _buildButton(text: '9'),
                          _buildButton(
                              text: '×',
                              backgroundColor: const Color(0xFF0A84FF),
                              textColor: Colors.white),
                        ]),
                      ),
                      Expanded(
                        child: Row(children: [
                          _buildButton(text: '4'),
                          _buildButton(text: '5'),
                          _buildButton(text: '6'),
                          _buildButton(
                              text: '-',
                              backgroundColor: const Color(0xFF0A84FF),
                              textColor: Colors.white),
                        ]),
                      ),
                      Expanded(
                        child: Row(children: [
                          _buildButton(text: '1'),
                          _buildButton(text: '2'),
                          _buildButton(text: '3'),
                          _buildButton(
                              text: '+',
                              backgroundColor: const Color(0xFF0A84FF),
                              textColor: Colors.white),
                        ]),
                      ),
                      Expanded(
                        child: Row(children: [
                          _buildButton(text: '.'),
                          _buildButton(text: '0'),
                          _buildButton(
                              text: 'x²',
                              backgroundColor: const Color(0xFF505052),
                              fontSize: 18),
                          _buildButton(
                              text: '√',
                              backgroundColor: const Color(0xFF505052),
                              fontSize: 18),
                        ]),
                      ),
                      Expanded(
                        child: Row(children: [
                          _buildButton(text: '0', flex: 2),
                          _buildButton(
                              text: '⌫',
                              backgroundColor: const Color(0xFFFF9F0A),
                              textColor: Colors.white),
                          _buildButton(
                              text: '=',
                              backgroundColor: const Color(0xFF32D74B),
                              textColor: Colors.white),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
