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

---

## Kayıt 2 — Faz 1: Yerel Proje İskeleti ve GitHub Bağlantısı
- **Tarih:** 21.11.2026
- **Faz ve Amaç:** Faz 1 — Yerel Git deposunun başlatılması, güvenlik odaklı `.gitignore` yapılandırması, temel dokümantasyon dosyalarının oluşturulması ve GitHub uzak deposuyla senkronizasyon.
- **Yapılan İşlemler:**
  - Yerel dizinde (`D:\secureflow-devsecops`) Git deposu başlatıldı ve varsayılan dal `main` olarak ayarlandı.
  - `.gitignore`, `.env.example`, `README.md`, `PROMPT.md` ve `docs/DEVELOPMENT_LOG.md` dosyaları oluşturuldu.
  - İlk commit oluşturularak uzak depoya (`origin/main`) gönderildi.
- **Kurulan Paketler ve Araç Sürümleri:** Ek paket kurulmadı; Git `2.47.1.windows.1` kullanıldı.
- **Çalıştırılan Komutlar:**
  - `mkdir docs`
  - `git init && git branch -M main`
  - `git add . && git commit -m "chore: proje iskeleti ve temel dokümantasyon dosyaları oluşturuldu"`
  - `git remote add origin https://github.com/MuhammedFatihSaltan/secureflow-devsecops.git && git push -u origin main`
  - `git status`
- **Testler ve Gerçek Sonuçlar:** `git status` çıktısı ile yerel `main` dalının `origin/main` ile güncel olduğu ve çalışma ağacının temiz olduğu (`nothing to commit, working tree clean`) doğrulandı.
- **Karşılaşılan Hatalar ve Çözümleri:** Hata ile karşılaşılmadı.
- **Manuel Web Arayüzü Ayarları:** GitHub üzerinde `MuhammedFatihSaltan/secureflow-devsecops` deposu doğrulandı.
- **Güvenlik Kararları ve Gerekçeleri:** `.venv/`, `.env`, `reports/`, `*.sarif` ve veritabanı dosyaları `.gitignore` içerisine eklenerek hassas verilerin ve geçici çıktıların sürüm kontrolüne girmesi engellendi.
- **Açık Kalan İşler ve Sonraki Faz:** Faz 2 kapsamında Python paket yapısının (`src/secureflow`), sanal ortamın, `pytest` altyapısının ve ilk GitHub Actions iş akışının oluşturulması.


---

## Kayıt 3 — Faz 2: Python İskeleti, Test Altyapısı ve İlk CI İş Akışı
- **Tarih:** 21.11.2026
- **Faz ve Amaç:** Faz 2 — Python çekirdek paket yapısının oluşturulması, izole sanal ortam kurulumu, `pytest` birim test altyapısının kurulması ve GitHub Actions üzerinde ilk otomatik test iş akışının doğrulanması.
- **Yapılan İşlemler:**
  - `src/secureflow`, `tests` ve `.github/workflows` dizinleri oluşturuldu.
  - Sürüm sabitleme (`pytest==8.3.3`) stratejisiyle `requirements.txt` dosyası hazırlandı.
  - Temel sistem durum kontrolü modülü (`src/secureflow/core.py`) ve birim testi (`tests/test_core.py`) yazıldı.
  - En az yetki prensibi (`permissions: contents: read`) gözetilerek `.github/workflows/ci.yml` iş akışı yapılandırıldı.
  - `PROMPT.md` ana talimat belgesi tam metin olarak depoya eklendi.
- **Kurulan Paketler ve Araç Sürümleri:**
  - `pytest==8.3.3` (Python `3.11.9` sanal ortamı `.venv` içinde)
- **Çalıştırılan Komutlar:**
  - `mkdir src\secureflow && mkdir tests && mkdir .github\workflows`
  - `py -m venv .venv && .venv\Scripts\activate`
  - `python -m pip install --upgrade pip && pip install pytest==8.3.3`
  - `set PYTHONPATH=src && pytest -v`
  - `git add . && git commit -m "feat: python paket iskeleti, pytest altyapısı ve ilk ci iş akışı eklendi" && git push`
  - `git add PROMPT.md && git commit -m "docs: ana geliştirme talimat belgesi (PROMPT.md) eklendi" && git push`
- **Testler ve Gerçek Sonuçlar:**
  - Yerel birim test sonucu: `1 passed in 0.02s`.
  - GitHub Actions `SecureFlow CI` iş akışı başarıyla tamamlandı.
- **Karşılaşılan Hatalar ve Çözümleri:** Hata ile karşılaşılmadı.
- **Manuel Web Arayüzü Ayarları:** GitHub deposu üzerinde Actions sekmesinden iş akışı yürütmesi doğrulandı.
- **Güvenlik Kararları ve Gerekçeleri:** GitHub Actions iş akışına yalnızca okuma yetkisi (`contents: read`) verildi; bağımlılıklar kesin sürüm numaralarıyla sabitlendi.
- **Açık Kalan İşler ve Sonraki Faz:** Faz 3 kapsamında Gitleaks aracının CI iş akışına entegre edilmesi, temiz kod ve sahte secret senaryolarının test edilmesi.