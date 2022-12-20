FROM ubuntu:20.04
RUN apt-get update && \
    apt-get install -y nginx=1.19*
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
EXPOSE 80 443
CMD ["/usr/local/bin/start.sh"]