FROM coqorg/coq:8.13

ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
  adwaita-icon-theme \
  libcairo2-dev \
  libexpat1-dev \
  libgtk-3-dev \
  libgtksourceview-3.0-dev \
  vim \
&& sudo apt-get clean && sudo rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
&& opam switch remove -y \
  4.05.0 \
  4.07.1+flambda \
&& opam switch create 4.12.0 \
&& opam install coqide -y \
&& opam clean \
&& eval $(opam env)

WORKDIR /coq-work

CMD ["bash"]
