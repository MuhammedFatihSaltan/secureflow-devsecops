FROM python:3.11-slim

# Python çıktı tamponlamasını kapat ve .pyc üretimini engelle
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app/src

WORKDIR /app

# Güvenlik: Taban işletim sistemi paketlerini güncelle
RUN apt-get update && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Bağımlılıkları SHA-256 hash doğrulaması ile kur
COPY requirements.txt .
RUN pip install --no-cache-dir --only-binary=:all: --require-hashes -r requirements.txt

# Güvenlik: Çalışma zamanında gerekmeyen ve gömülü eski kütüphane barındıran paketleme araçlarını kaldır
RUN pip uninstall -y setuptools wheel

# Uygulama kaynak kodunu kopyala
COPY src/ ./src/

# Güvenlik: Uygulamayı root yerine yetkisiz kullanıcı ile çalıştır
RUN useradd --create-home --shell /bin/bash appuser && \
    chown -R appuser:appuser /app
USER appuser

# Varsayılan doğrulama komutu
CMD ["python", "-c", "import secureflow; print('SecureFlow container calisiyor!')"]