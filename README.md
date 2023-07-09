```
docker run -d \
--net=host \
-v <media dir on host>:/media \
-v <conf on host>:/etc/minidlna.conf \
temak/minidlna
```