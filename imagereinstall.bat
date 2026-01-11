echo "Checking connect"
if curl -Is --max-time 5 "https://meqsave-default-rtdb.asia-southeast1.firebasedatabase.app/" >/dev/null 2>&1;
  echo "Connect Meqsave OK"
  if curl -Is --max-time 5 "https://github.com/" >/dev/null 2>&1; then
    echo "Connect Github OK"
  else
    read -p 'Fail To connect Github, Continue?  \(y/n\):' kebu
    case kebu in; y|Y) echo "ok";; n|N) exit;
else
  read -p 'Fail To connect Meqsave DB, Continue?  \(y/n\):' kebu
    case kebu in; y|Y) echo "ok";; n|N) exit;
