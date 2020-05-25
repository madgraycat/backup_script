#!/bin/bash
 echo "Hello"
 let N=3; # количество создаваемых файлов
 for  ((i=1; i <= N; i++))
  do
  base64 /dev/urandom | head -c 10000 > file[$i].txt
  rsync -avz file[$i].txt gato@192.168.1.152:/tmp/files
 done
 ssh gato@192.168.1.152 find /tmp/files -type f -mtime +7 | xargs rm -rf

