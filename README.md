https://github.com/docker/for-win/issues/4391#issuecomment-520420942

```
After a lot of trial and error, I believe I have solved the issue:

In Windows Defender Firewall with Advanced Security, the following rule needs to be created:

    Type: Inbound
    Program: C:\Program Files\Docker\Docker\resources\com.docker.backend.exe
    Allow all connections

Other machines on the local network can now reach my containers. My nginx reverse proxy is also working again and I can access my exposed containers from the internet.

Hopefully this fix will work for others in this thread.

```

```
Search for a blocking rule call com.docker.bakend added after upgrade. Blocking takes precedence, that's why it doesn't work even if you the rule in @sjdvda workaround.
```