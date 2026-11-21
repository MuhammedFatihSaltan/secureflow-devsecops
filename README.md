# SecureFlow — CI/CD Süreçlerinde Otomatik Zafiyet Araması ve DevSecOps Boru Hattı

SecureFlow, yazılım geliştirme yaşam döngüsüne (SDLC) entegre edilen; gizli bilgi (secret) sızıntılarını, statik kod zafiyetlerini, bağımlılık ve konteyner imajı açıklarını otomatik olarak tarayan ve belirlenen güvenlik politikalarına göre CI/CD akışını yöneten bir DevSecOps platformudur.

## Proje Amacı
- **Shift-Left Security:** Güvenlik kontrollerini üretim aşamasına gelmeden geliştirme ve entegrasyon adımlarına taşımak.
- **Merkezi Karar Mekanizması:** Farklı güvenlik araçlarından (Gitleaks, SonarQube Cloud, Trivy, OWASP ZAP) elde edilen bulguları Python tabanlı karar motoru ile ortak bir veri modelinde normalize etmek ve `PASS`, `WARNING` veya `FAIL` kararı üretmek.
- **Ölçülebilir Raporlama:** Tarama sonuçlarını politika kurallarıyla birlikte JSON, HTML ve PDF formatlarında raporlamak.

## Planlanan Teknoloji Yığını
- **Sürüm Kontrol & CI/CD:** Git, GitHub, GitHub Actions
- **Karar Motoru & Test:** Python 3.11, pytest, ReportLab
- **Güvenlik Araçları:** Gitleaks, SonarQube Cloud, Trivy, OWASP ZAP
- **Konteynerizasyon:** Docker

## Geliştirme Durumu
Proje faz bazlı olarak geliştirilmektedir. Teknik kararlar ve ilerleme kayıtları `docs/DEVELOPMENT_LOG.md` dosyasında tutulmaktadır.