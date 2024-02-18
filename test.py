import subprocess
import time
import os

def check_ping(ip):
    try:
        output = subprocess.check_output(["ping", "-c", "1", ip])
        return True
    except subprocess.CalledProcessError:
        return False

ip_address = "8.8.8.8"

while True:  # حلقه بی‌نهایت برای چک کردن پینگ هر ۵ ثانیه
    success = check_ping(ip_address)
    if success:
        print("\033[92mPing success\033[0m")
    else:
        print("\033[91mPing failure\033[0m")
        os.system('play-audio beep.mp3 &')  # پخش صدا در صورت عدم موفقیت
    time.sleep(5)  # وقفه ۵ ثانیه‌ای قبل از تکرار حلقه
