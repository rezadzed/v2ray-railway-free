FROM teddysun/xray

ENV UUID=34a5203e-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ENV WS_PATH=/v2
ENV PORT=443

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
