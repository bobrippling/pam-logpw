Add the following to `/etc/pam.d/common-account`, under the `pam_unix` entry, and modify `success=1` to `success=2` so successful logins skip password logging.


```
auth optional pam_exec.so expose_authtok quiet seteuid /usr/local/sbin/pam-logpw
```

or apply the following diff:

```diff
@@ -14,7 +14,9 @@
 # pam-auth-update(8) for details.

 # here are the per-package modules (the "Primary" block)
-auth   [success=1 default=ignore]      pam_unix.so nullok_secure
+auth   [success=2 default=ignore]      pam_unix.so nullok_secure
+auth optional pam_exec.so expose_authtok quiet seteuid /usr/local/sbin/pam-logpw
 # here's the fallback if no module succeeds
 auth   requisite                       pam_deny.so

```

The following can be used to get pam to do the logging, but the log-file must be world-writable:
```
auth optional pam_exec.so expose_authtok quiet log=/var/log/pwattempts /usr/local/sbin/pam-logpw
```
