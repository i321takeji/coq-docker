FROM ubuntu:18.04 AS coq-build

ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

ARG coq_version="8.9.0"

ENV COQBIN /usr/local/bin/
WORKDIR /tmp

# change apt source
RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
&& apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  camlp5 \
  liblablgtk-extras-ocaml-dev \
  liblablgtk2-ocaml-dev \
  ocaml \
  ocaml-findlib \
  vim \
  wget \
&& apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
&& wget -O - "https://github.com/coq/coq/archive/V${coq_version}.tar.gz" | tar zxf - \
&& cd "coq-${coq_version}" \
&& ./configure -bindir  /usr/local/bin \
               -libdir /usr/local/lib/coq \
               -configdir /etc/xdg/coq \
               -datadir /usr/local/share/coq \
               -mandir /usr/local/share/man \
               -docdir /usr/local/share/doc/coq \
               -coqdocdir /usr/local/share/texmf/tex/latex/misc \
&& make \
&& make install


FROM ubuntu:18.04
ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

# change apt source
RUN sed -i.bak -e "s%http://.*.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
&& apt-get update && apt-get install -y --no-install-recommends \
  libgtksourceview2.0-dev \
  vim \
&& apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY --from=coq-build /usr/local/bin /usr/local/bin
COPY --from=coq-build /usr/local/lib /usr/local/lib
COPY --from=coq-build /usr/local/share /usr/local/share
COPY --from=coq-build /etc/xdg/coq /etc/xdg/coq

COPY res/entrypoint.sh /usr/local/coq_init/entrypoint.sh
RUN chmod +x /usr/local/coq_init/entrypoint.sh

ENV COQ_USER coqsan
ENV COQ_UID 99999
ENV COQ_GID 99999

WORKDIR /coq-work

ENTRYPOINT ["/usr/local/coq_init/entrypoint.sh"]
CMD ["bash"]
