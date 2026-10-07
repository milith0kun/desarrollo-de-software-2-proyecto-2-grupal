# Proyecto Integrador 2 — Catálogo de Emprendimiento Local (Grupo 2)
**Universidad Nacional de San Antonio Abad del Cusco (UNSAAC)**  
**Facultad de Ingeniería Eléctrica, Electrónica, Informática y Mecánica**  
**Escuela Profesional de Ingeniería Informática y de Sistemas**  
*Desarrollo de Software II (IF616AIN) — Semestre Académico 2026-II*

---

## 👥 Equipo de Trabajo: **GRUPO 2**
- **Edmil Jampier Saire Bustamante** (Código: `174449`)
- **Alain Armando Condori Contreras**
- **Axel Aranibar Rojas**
- **Docente:** *Mtro. Ing. Yover Collantes Valer*

---

## 🛍️ Emprendimiento Local: «Aroma Sagrado»
Aplicación móvil de catálogo para la comercialización de cafés de especialidad (*Geisha*, *Bourbon*, *Typica*) y cacao nativo *Chuncho* 100% orgánico de los valles de La Convención, Cusco (*Santa Teresa, Echarati, Ocobamba*).

---

## 🚀 Estructura de Entregables

| Archivo / Carpeta | Descripción |
| :--- | :--- |
| [`app_catalogo_grupo2/`](./app_catalogo_grupo2/) | Código fuente del proyecto Flutter modularizado y probado (`0 issues` en `flutter analyze`). |
| [`app_catalogo_grupo2.apk`](./app_catalogo_grupo2.apk) | Binario ejecutable compilado en modo **Release** para Android (42.9 MB). |
| [`app_catalogo_grupo2.zip`](./app_catalogo_grupo2.zip) | Código fuente comprimido para entrega en aula virtual. |
| [`informe/informe_proyecto_02_grupal.pdf`](./informe/informe_proyecto_02_grupal.pdf) | Informe técnico formal en LaTeX de 9 páginas con capturas reales y rúbrica de 20 puntos. |
| [`informe/informe_proyecto_02_grupal.tex`](./informe/informe_proyecto_02_grupal.tex) | Código fuente en LaTeX del informe. |
| [`informe/imagenes/`](./informe/imagenes/) | Capturas reales en alta resolución generadas desde el motor de renderizado. |

---

## 🛠️ Instrucciones de Ejecución

### 1. Ejecutar en Emulador o Dispositivo Físico
```powershell
cd "proyecto_grupal_02\app_catalogo_grupo2"
flutter run
```

### 2. Ejecutar Pruebas y Generar Capturas Reales
```powershell
flutter test test/screenshot_generator_test.dart
```

### 3. Compilar APK Release
```powershell
flutter build apk --release
```
