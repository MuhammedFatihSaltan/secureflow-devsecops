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


---

## Kayıt 4 — Faz 3: Gitleaks Secret Taraması ve Güvenlik Kapısı Doğrulaması
- **Tarih:** 21.11.2026
- **Faz ve Amaç:** Faz 3 — CI/CD boru hattına Gitleaks entegrasyonu, temiz kod (negatif) ve sahte gizli anahtar (pozitif) senaryolarının test edilerek güvenlik kapısı davranışının doğrulanması.
- **Yapılan İşlemler:**
  - `.github/workflows/ci.yml` dosyasına `gitleaks/gitleaks-action@v2` adımı `fetch-depth: 0` parametresiyle eklendi ve `python-tests` işi `needs: secret-scan` bağımlılığıyla bu güvenlik kapısına bağlandı.
  - Temiz kod üzerinde ilk doğrulama (`PASS`) yapıldı.
  - Ana dalı (`main`) kirletmemek için `test/gitleaks-secret-check` dalı oluşturularak Pull Request üzerinden kontrollü sahte secret testleri gerçekleştirildi.
  - Test tamamlandıktan sonra PR birleştirilmeden kapatıldı ve geçici test dalı silindi.
- **Kurulan Paketler ve Araç Sürümleri:** `gitleaks/gitleaks-action@v2` (GitHub Actions runner üzerinde).
- **Çalıştırılan Komutlar:**
  - `git add . && git commit -m "feat: ci iş akışına gitleaks secret taraması eklendi" && git push`
  - `git checkout -b test/gitleaks-secret-check`
  - `git add tests/fixtures/sample_leaked_secret.py && git commit -m "test: gitleaks allowlist dışı sahte token örneği güncellendi" && git push -u origin test/gitleaks-secret-check`
  - `git checkout main && git branch -D test/gitleaks-secret-check`
- **Testler ve Gerçek Sonuçlar:**
  - **Negatif Senaryo (Temiz Kod):** `SecureFlow CI #3` (commit `85041a5`) 24 saniyede `PASS` verdi.
  - **Pozitif Senaryo 1 (AWS Dokümantasyon Örneği):** `AKIAIOSFODNN7EXAMPLE` değeri Gitleaks'in yerleşik yanlış pozitif istisna listesinde (allowlist) yer aldığı için `PASS` verdi (önemli teknik bulgu olarak kaydedildi).
  - **Pozitif Senaryo 2 (Allowlist Dışı Sahte Token):** Sahte `ghp_...` formatlı token eklendiğinde `Gitleaks Secret Taraması` 8 saniyede `FAIL` verdi ve `Python Ortamı ve Birim Testleri` adımı otomatik olarak atlandı (`Skipped`).
- **Karşılaşılan Hatalar ve Çözümleri:** İlk testte kullanılan AWS resmi örnek anahtarı Gitleaks allowlist'ine takıldığı için desen uyumlu farklı bir sahte token ile test güncellenerek beklendiği gibi `FAIL` davranışı doğrulandı.
- **Manuel Web Arayüzü Ayarları:** GitHub üzerinde test PR'ı açıldı, CI başarısızlığı doğrulandı ve PR merge edilmeden kapatılıp uzak test dalı silindi.
- **Güvenlik Kararları ve Gerekçeleri:** Test verilerinin ana dal geçmişinde kalmaması için izole dal + PR stratejisi uygulandı; gerçek API anahtarı yerine sahte test verisi kullanıldı.
- **Açık Kalan İşler ve Sonraki Faz:** Faz 4 kapsamında SonarQube Cloud statik kod analizi (SAST) ve Quality Gate entegrasyonunun yapılması.