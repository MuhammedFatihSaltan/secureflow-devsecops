"""SecureFlow temel modül birim testleri."""

from secureflow.core import get_system_status


def test_get_system_status() -> None:
    """Sistem durum bilgisinin beklenen anahtar ve değerleri döndürdüğünü doğrular."""
    result = get_system_status()
    assert result["service"] == "SecureFlow"
    assert result["status"] == "ready"
    assert result["policy_mode"] == "strict"