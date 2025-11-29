# iOS Permissions Configuration

Aplikasi Solusi memerlukan beberapa permission khusus untuk iOS agar dapat berfungsi dengan optimal.

## Location Permission

### Konfigurasi di Info.plist

Aplikasi ini menggunakan 3 jenis location permission:

1. **NSLocationWhenInUseUsageDescription**: Untuk akses lokasi saat aplikasi aktif
2. **NSLocationAlwaysUsageDescription**: Untuk akses lokasi di background  
3. **NSLocationAlwaysAndWhenInUseUsageDescription**: Kombinasi keduanya (iOS 11+)
4. **NSLocationTemporaryUsageDescriptionDictionary**: Untuk precise location (iOS 14+)

### Implementasi di Code

```dart
// Request basic location permission
final bool locationGranted = await requestIOSLocationPermission();

// Request precise location (iOS 14+)  
final bool preciseLocationGranted = await requestIOSPreciseLocationPermission();

// Get current location with error handling
final Position? position = await getCurrentLocation();

// Check if location service is enabled
final bool serviceEnabled = await isLocationServiceEnabled();
```

### Best Practices

1. **Selalu cek service enabled** sebelum request permission
2. **Handle semua status permission** (denied, deniedForever, restricted)
3. **Gunakan timeout** saat get current position
4. **Request precise location** hanya jika diperlukan untuk akurasi tinggi

## Biometric Permission (Face ID/Touch ID)

### Konfigurasi di Info.plist

```xml
<key>NSFaceIDUsageDescription</key>
<string>Aplikasi ini membutuhkan Face ID / Touch ID untuk autentikasi.</string>
```

### Implementasi di Code

```dart
// Request biometric permission
final bool biometricGranted = await requestIOSBiometricPermission();

// Authenticate with biometric
await authenticate();
```

## App Tracking Transparency

### Konfigurasi di Info.plist

```xml
<key>NSUserTrackingUsageDescription</key>
<string>Aplikasi ini menggunakan data untuk memberikan pengalaman yang lebih personal dan iklan yang relevan.</string>
```

### Implementasi di Code

```dart
// Request tracking permission (iOS 14.5+)
final bool trackingGranted = await requestIOSTrackingPermission();
```

## Request All Permissions

Untuk kemudahan, gunakan fungsi ini untuk request semua permission sekaligus:

```dart
final Map<String, bool> permissions = await requestAllIOSPermissions();

print('Location: ${permissions['location']}');
print('Precise Location: ${permissions['preciseLocation']}');  
print('Biometric: ${permissions['biometric']}');
print('Tracking: ${permissions['tracking']}');
```

## Troubleshooting

### Location Permission Tidak Berfungsi

1. **Cek Info.plist**: Pastikan semua key permission sudah ada
2. **Cek iOS Version**: Beberapa permission butuh iOS version tertentu
3. **Cek Device Settings**: User mungkin disable location di Settings
4. **Cek Network**: Beberapa location service butuh internet

### Permission Denied Forever

Jika user pilih "Don't Allow" dan centang "Don't Ask Again":

```dart
if (permission == LocationPermission.deniedForever) {
  // Arahkan user ke Settings
  await Geolocator.openAppSettings();
}
```

### iOS 14+ Precise Location

Mulai iOS 14, user bisa pilih "Precise" atau "Approximate" location. Untuk fitur yang butuh akurasi tinggi (seperti absensi), pastikan request precise location.

## Testing

### Simulator

- Location permission bisa di-test di Simulator
- Gunakan menu Device > Location untuk simulate different locations
- Biometric tidak bisa di-test di Simulator

### Physical Device  

- Test semua permission scenarios (allow, deny, deny forever)
- Test dengan location service disabled
- Test dengan different iOS versions (14+, 15+, 16+)

## Dependencies

Pastikan dependencies berikut sudah ada di `pubspec.yaml`:

```yaml
dependencies:
  permission_handler: ^12.0.1
  geolocator: ^13.0.4
  local_auth: ^2.3.0
  app_tracking_transparency: ^2.0.6
```