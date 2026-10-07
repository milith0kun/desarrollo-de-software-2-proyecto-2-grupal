import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_catalogo_grupo2/main.dart';
import 'package:app_catalogo_grupo2/screens/catalogo_screen.dart';

Future<void> _cargarFuentesCompletas() async {
  final iconFile = File(r'C:\Users\PC\flutter\bin\cache\artifacts\material_fonts\materialicons-regular.otf');
  if (iconFile.existsSync()) {
    final fontLoader = FontLoader('MaterialIcons');
    fontLoader.addFont(Future.value(ByteData.sublistView(iconFile.readAsBytesSync())));
    await fontLoader.load();
  }

  final segoeFile = File(r'C:\Windows\Fonts\segoeui.ttf');
  if (segoeFile.existsSync()) {
    final bytes = segoeFile.readAsBytesSync();
    final fontLoader = FontLoader('Roboto');
    fontLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await fontLoader.load();

    final sansLoader = FontLoader('sans-serif');
    sansLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await sansLoader.load();
  }

  final segoeBold = File(r'C:\Windows\Fonts\segoeuib.ttf');
  if (segoeBold.existsSync()) {
    final bytes = segoeBold.readAsBytesSync();
    final fontLoader = FontLoader('Roboto');
    fontLoader.addFont(Future.value(ByteData.sublistView(bytes)));
    await fontLoader.load();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await _cargarFuentesCompletas();
  });

  // 1. Captura en modo móvil completa (< 600 pt -> 2 columnas en GridView)
  testWidgets('Generar captura real de catálogo en modo móvil', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 4400);
    tester.view.devicePixelRatio = 2.625;

    final GlobalKey key = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.android,
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF7A1F2B),
            primary: const Color(0xFF7A1F2B),
            secondary: const Color(0xFFC9971F),
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF8FAFC),
          scrollbarTheme: const ScrollbarThemeData(
            thumbVisibility: WidgetStatePropertyAll(false),
            trackVisibility: WidgetStatePropertyAll(false),
          ),
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
            child: child!,
          );
        },
        home: RepaintBoundary(
          key: key,
          child: const CatalogoScreen(),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 600));

    await tester.runAsync(() async {
      final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final ui.Image image = await boundary.toImage(pixelRatio: 2.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          final buffer = byteData.buffer.asUint8List();
          final outputDir = Directory('../informe/imagenes');
          if (!outputDir.existsSync()) {
            outputDir.createSync(recursive: true);
          }
          final file = File('../informe/imagenes/captura_catalogo_movil.png');
          await file.writeAsBytes(buffer);
        }
      }
    });
  });

  // 2. Captura en modo tableta (750 pt -> 3 columnas en GridView)
  testWidgets('Generar captura real de catálogo en modo tableta', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1800, 3200);
    tester.view.devicePixelRatio = 2.0;

    final GlobalKey key = GlobalKey();

    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.android,
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF7A1F2B),
            primary: const Color(0xFF7A1F2B),
            secondary: const Color(0xFFC9971F),
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF8FAFC),
          scrollbarTheme: const ScrollbarThemeData(
            thumbVisibility: WidgetStatePropertyAll(false),
            trackVisibility: WidgetStatePropertyAll(false),
          ),
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: const MaterialScrollBehavior().copyWith(scrollbars: false),
            child: child!,
          );
        },
        home: RepaintBoundary(
          key: key,
          child: const CatalogoScreen(),
        ),
      ),
    );

    await tester.pump(const Duration(milliseconds: 600));

    await tester.runAsync(() async {
      final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final ui.Image image = await boundary.toImage(pixelRatio: 2.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          final buffer = byteData.buffer.asUint8List();
          final file = File('../informe/imagenes/captura_catalogo_tableta.png');
          await file.writeAsBytes(buffer);
        }
      }
    });
  });
}
