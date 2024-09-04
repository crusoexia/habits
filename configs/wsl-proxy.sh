# Note: make sure the windows firewall had been configured to allow http connection
# between wsl and windows

host_ip=$(ip route | grep default | grep -oE '([0123456789.]+){4}')
export ALL_PROXY="socks://$host_ip:10810"
export http_proxy="http://$host_ip:10811"
export https_proxy="http://$host_ip:10811"
