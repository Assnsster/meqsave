# MEQSAVE
image windows for non-open port VM by using sshx
## Install Image command
```bash
curl https://raw.githubusercontent.com/Assnsster/meqsave/refs/heads/main/imagereinstall.sh |bash
```

or

```bash
wget https://raw.githubusercontent.com/Assnsster/meqsave/refs/heads/main/imagereinstall.sh -O img.sh && bash img.sh
```
## Usage
- run `Install Image command` on VM, save VM IP and goto [meqsave.vercel.app](https://meqsave.vercel.app) enter ip, After installation, link of `sshx.io` show
- run `set.bat` on sshx to set variable, fix error
- run `kami-tunnel <port>` to open port RDP: 3389, VNC: 5900.  ex: `kami-tunnel 3389`
- VM Credentials is:
    `user`: `win11`
    `pass`: `win11`
  work for RDP and VNC
  
# 3rd Repository use
 (https://github.com/kami2k1/tunnel)
 (https://github.com/bin456789/reinstall)
