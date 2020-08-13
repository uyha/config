function gaExplorer
  begin
    set -lx DISPLAY (cat /etc/resolv.conf | awk '/nameserver/ {print $2}'):0.0
    command gaExplorer &> /dev/null 
end
end
