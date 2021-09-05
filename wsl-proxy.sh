host_ip=$(cat /etc/resolv.conf | grep nameserver | grep -oE '[0123456789.]*')
export ALL_PROXY="socks://$host_ip:10808"
export http_proxy="http://$host_ip:10809"
export https_proxy="http://$host_ip:10809"
