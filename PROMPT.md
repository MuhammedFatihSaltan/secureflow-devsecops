# SecureFlow — Geliştirme Günlüğü (Development Log)

Bu dosya proje süresince alınan teknik kararları, yapılan işlemleri, test sonuçlarını ve karşılaşılan sorunların çözümlerini kayıt altına alır.

---

## Kayıt 1 — Faz 0: Ortam ve Gereksinim Analizi
- **Tarih:** 21.11.2026
- **Faz ve Amaç:** Faz 0 — Geliştirme ortamındaki araçların doğrulanması, proje kapsamının netleştirilmesi ve uzak depo hazırlığı.
- **Yapılan İşlemler:**
  - Windows CMD üzerinden Python, Git ve Docker kurulumları doğrulandı.
  - Proje kapsamı (Shift-Left Security yaklaşımı, Python karar motoru, otomatik CI/CD kontrolleri) ve kapsam dışı unsurlar (ilk sürümde üretim ortamına dağıtım yapılmaması) belirlendi.
  - Yerel proje klasörü (`D:\secureflow-devsecops`) ve GitHub uzak deposu oluşturuldu.
- **Kurulan Paketler ve Araç Sürümleri:**
  - Python: `3.11.9`
  - Git: `2.47.1.windows.1`
  - Docker: `29.4.3` (build `055a478`)
- **Çalıştırılan Komutlar:**
  - `python --version`
  - `py --version`
  - `git --version`
  - `docker --version`
  - `mkdir secureflow-devsecops && cd secureflow-devsecops`
- **Testler ve Gerçek Sonuçlar:** Tüm temel araçların kurulu olduğu ve beklenen sürümleri döndürdüğü doğrulandı.
- **Karşılaşılan Hatalar ve Çözümleri:** Hata ile karşılaşılmadı.
- **Manuel Web Arayüzü Ayarları:** GitHub üzerinde `MuhammedFatihSaltan/secureflow-devsecops` adında boş bir depo oluşturuldu.
- **Güvenlik Kararları ve Gerekçeleri:** Uzak depo çakışmalarını önlemek için boş başlatıldı; gizli anahtarların depoya sızmasını engellemek amacıyla ilk commit öncesinde `.gitignore` yapılandırması zorunlu tutuldu.
- **Açık Kalan İşler ve Sonraki Faz:** Faz 1 kapsamında yerel Git deposunun başlatılması, ilk dosyaların oluşturulması ve GitHub `main` dalına gönderilmesi.