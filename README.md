# habits
My terminal habits. 

> Without terminal I cannot work; Without these habits I cannot use terminal.

## Install

### ubuntu

```sh
git clone git@github.com:crusoexia/habits.git ~/habits && ./habits/setup.ubuntu.sh
```

### wsl

> Recently, it cannot access github via ssh in wsl, so I have to fallback to use https. Do remember to update the [PAT](https://github.com/settings/tokens)(Personal access token) to pass the MFA authentication for `git push`.

#### 1. Config proxy

1. Copy the content of `habits/configs/wsl-proxy.sh` to `~/.profile`.
2. Restart the wsl via run command `wsl --shutdown` in `powershell`.

#### 2. Run setup command

```sh
cd habits
./setup.wsl.sh
```
