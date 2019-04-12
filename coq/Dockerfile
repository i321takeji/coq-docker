FROM bamboog130/build-coq:8.8.2 AS coq-dev

FROM ubuntu:18.04
ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

# change apt source
RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
&& apt-get update && apt-get install -y --no-install-recommends \
  libgtksourceview2.0-dev \
  vim \
&& apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY --from=coq-dev /usr/local/bin /usr/local/bin
COPY --from=coq-dev /usr/local/lib /usr/local/lib
COPY --from=coq-dev /usr/local/share /usr/local/share

COPY res/entrypoint.sh /usr/local/coq_init/entrypoint.sh
RUN chmod +x /usr/local/coq_init/entrypoint.sh

ENV COQ_USER coqsan
ENV COQ_UID 99999
ENV COQ_GID 99999

WORKDIR /coq-work

ENTRYPOINT ["/usr/local/coq_init/entrypoint.sh"]
CMD ["bash"]
