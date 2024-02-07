# cloudflared with tunnel_token_file environment veriable allwoing token from file or secret
FROM busybox:1.36.1-uclibc as busybox
FROM cloudflare/cloudflared:latest
COPY --from=busybox /bin/sh /bin/sh
COPY --from=busybox /bin/cat /bin/cat
ENTRYPOINT [ "/bin/sh", "-c", "export TUNNEL_TOKEN=$(cat $TUNNEL_TOKEN_FILE); cloudflared --no-autoupdate tunnel run" ]
