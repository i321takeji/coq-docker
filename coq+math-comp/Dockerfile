FROM bamboog130/coq:8.9.0 AS math-comp-build

ARG math_comp_version="1.8.0"

#ENV COQBIN /usr/local/bin/
WORKDIR /tmp

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  wget \
&& wget -O - "https://github.com/math-comp/math-comp/archive/mathcomp-${math_comp_version}.tar.gz" | tar zxf - \
&& cd "math-comp-mathcomp-${math_comp_version}/mathcomp" \
&& make \
&& make install

WORKDIR /coq-work


FROM bamboog130/coq:8.9.0

COPY --from=math-comp-build /usr/local/lib/coq/user-contrib/mathcomp/ /usr/local/lib/coq/user-contrib/mathcomp/

WORKDIR /coq-work

CMD ["bash"]
