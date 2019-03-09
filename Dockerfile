FROM my/coq-build AS coq-dev

FROM ubuntu:18.04
ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

# change apt source
RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
RUN apt-get update && apt-get install -y --no-install-recommends \
  libgtksourceview2.0-dev \
  vim \
&& apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

#COPY res/entrypoint.sh /usr/local/bin
#RUN chmod +x /usr/local/bin/entrypoint.sh

COPY --from=coq-dev /usr/local/bin /usr/local/bin
COPY --from=coq-dev /usr/local/lib /usr/local/lib
COPY --from=coq-dev /usr/local/share /usr/local/share

WORKDIR /coq-work

ENV COQ_USER developer
ENV COQ_UID 99999
ENV COQ_GID 99999

#ENTRYPOINT ["entrypoint.sh"]
CMD ["bash"]