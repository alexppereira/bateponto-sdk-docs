import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatePontoButton extends StatefulWidget {
  const BatePontoButton({super.key});

  @override
  State<BatePontoButton> createState() => _BatePontoButtonState();
}

class _BatePontoButtonState extends State<BatePontoButton> {
  static const _channel = MethodChannel('com.pontotel.bateponto/sdk');
  bool _opening = false;

  Future<void> _open() async {
    if (_opening) return;
    setState(() => _opening = true);
    try {
      await _channel.invokeMethod<void>('open');
    } on PlatformException {
      _showError('Não foi possível abrir o BatePonto. Tente novamente.');
    } on MissingPluginException {
      _showError('A integração Android do BatePonto não está disponível.');
    } finally {
      if (mounted) setState(() => _opening = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAndroid = !kIsWeb &&
        defaultTargetPlatform == TargetPlatform.android;
    return FilledButton(
      onPressed: isAndroid && !_opening ? _open : null,
      child: Text(_opening ? 'Abrindo…' : 'Abrir BatePonto'),
    );
  }
}
