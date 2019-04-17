FROM bamboog130/coq:srcmathcomp-1.8.0 AS math-comp-dev

FROM bamboog130/coq:8.9.0

COPY --from=math-comp-dev /usr/local/lib/coq/user-contrib/mathcomp/ /usr/local/lib/coq/user-contrib/mathcomp/

WORKDIR /coq-work

CMD ["bash"]
