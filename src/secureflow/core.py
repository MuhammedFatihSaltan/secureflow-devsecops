"""SecureFlow temel sistem ve politika doğrulama yardımcıları."""

from typing import Dict


def get_system_status() -> Dict[str, str]:
    """Sistemin temel çalışma durumunu ve varsayılan politika modunu döndürür."""
    return {
        "service": "SecureFlow",
        "status": "ready",
        "policy_mode": "strict",
    }


    AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"