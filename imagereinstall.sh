echo "Checking connect"
if nc -zw 5 meqsave-default-rtdb.asia-southeast1.firebasedatabase.app 443; then
  echo "Connect Meqsave OK"
  if curl -Is --max-time 5 "github.com" >/dev/null 2>&1; then
    echo "Connect Github OK"
  else
    read -p 'Fail To connect Github, Continue? (y/n):' kebu
    case $kebu in y|Y) echo "ok";; n|N) exit;; esac
  fi
else
  read -p 'Fail To connect Meqsave DB, Continue? (y/n):' kebua
    case $kebua in y|Y) echo "ok";; n|N) exit;; esac
fi
echo "watch log in meqsave.vercel.app (Enter IP)"
echo -ne "Windows VM:\nUser:win11\nPassword:win11\n"
echo "your Public IP is: $(curl -s https://api.ipify.org)"
echo "After complete, it will automatically reboot"
read -p 'continue y/n:' kebub
case $kebub in y|Y) echo "ok";; n|N) exit;; esac
clear
echo "$(curl -s https://api.ipify.org)"
curl -s -O https://raw.githubusercontent.com/assnsster/reinstall/main/reinstall.sh || wget -O ${_##*/} $_
# Debug on port 5922 ( ssh ), user: root   pass: win11
bash reinstall.sh dd --img "https://api.cloud.hashicorp.com/vagrant-archivist/v1/object/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJ3aW5tZXEvd2lubGl0ZTExLzE5MS93aW4xMWxpdGUvNDYwOTlhMGUtZWUwMi0xMWYwLTk4MGMtYjJmNjkyZGFlNjhmIiwibW9kZSI6InIiLCJmaWxlbmFtZSI6IndpbmxpdGUxMV8xOTFfd2luMTFsaXRlX2FtZDY0LmJveCJ9.HbuNzX-H7TQa_yQR_ZypXEiLgnlTUZ9NAdhS_bIiVMA" --password win11 --ssh-port 5922
