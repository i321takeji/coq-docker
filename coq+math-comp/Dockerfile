FROM bamboog130/build-math-comp:1.7.0 AS math-comp-dev

FROM bamboog130/coq:8.8.2

COPY --from=math-comp-dev /usr/local/lib/coq/user-contrib/mathcomp/ /usr/local/lib/coq/user-contrib/mathcomp/

WORKDIR /coq-work

CMD ["bash"]
