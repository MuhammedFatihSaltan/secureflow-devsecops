# SecureFlow — CI/CD Boru Hatlarında Otomatik Güvenlik Açığı Taraması (DevSecOps)

**SecureFlow**, yazılım geliştirme yaşam döngüsünün (SDLC) en erken aşamalarında güvenlik kontrollerini otomatize eden (**Shift-Left Security**), çok katmanlı ve sıfır-güven (**Zero-Trust**) prensiplerine dayalı bir **DevSecOps CI/CD** mimarisidir.

---

## 1. Mimari Akış ve Güvenlik Kapıları (Security Gates)

Her `push` ve `pull_request` olayında GitHub Actions üzerinde 4 aşamalı güvenlik kapısı sırasıyla tetiklenir. Herhangi bir aşamada kritik bulgu tespit edildiğinde boru hattı otomatik olarak durdurulur (**Fail-Fast**):

```text
[Git Push / PR]
       │
       ▼
┌─────────────────────────────────────────────────────────────┐
│ 1. Secret Detection (Gitleaks v2.3.9 - Commit SHA Pinned)   │
│    • Tüm Git geçmişinde API anahtarı, token ve parola tarama│
│    • Çıktı: gitleaks-sarif-report (SARIF)                   │
└──────────────────────────────┬──────────────────────────────┘
                               ▼ (PASS)
┌─────────────────────────────────────────────────────────────┐
│ 2. Supply Chain & Unit Testing (Python 3.11 + Pytest)       │
│    • SHA-256 hash doğrulamalı kurulum (--require-hashes)    │
│    • Birim testleri ve XML kod kapsama analizi (coverage)   │
└──────────────────────────────┬──────────────────────────────┘
                               ▼ (PASS)
┌─────────────────────────────────────────────────────────────┐
│ 3. SAST & Quality Gate (SonarQube Cloud)                    │
│    • Statik kod analizi, güvenlik açıkları ve kod kalitesi  │
│    • sonar.qualitygate.wait=true ile zorunlu kalite kapısı  │
└──────────────────────────────┬──────────────────────────────┘
                               ▼ (PASS)
┌─────────────────────────────────────────────────────────────┐
│ 4. IaC, Dependency & Container Scan (Trivy v0.36.0)         │
│    • Dosya sistemi ve Dockerfile misconfiguration taraması  │
│    • Hardened Docker imajı (non-root appuser) CVE taraması  │
│    • Çıktı: trivy-sarif-reports (SARIF)                     │
└─────────────────────────────────────────────────────────────┘