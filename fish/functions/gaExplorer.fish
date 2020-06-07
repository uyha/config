function gaExplorer
  begin
    set host (grep -oP "nameserver \K.*" /etc/resolv.conf)
    set -lx DISPLAY $host:0.0
    command gaExplorer &> /dev/null 
  end
end
