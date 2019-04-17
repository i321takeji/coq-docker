# Docker image for Coq
## Tags
- `8.8.0`
- `mathcomp-1.7.0` (+ Coq-8.8.0)
- `8.9.0`
- `mathcomp-1.8.0` (+ Coq-8.9.0)

## Usage
```bash
$ docker pull bamboo130/coq:mathcomp-1.8.0
$ docker run --rm -it bamboo130/coq:mathcomp-1.8.0

coqsan@XXXX:/coq-work$ coqtop
```

```bash
$ docker pull bamboo130/coq:mathcomp-1.8.0
$ ./start.sh

coqsan@XXXX:/coq-work$ coqide &
```

### Memo
- https://github.com/coq/coq.git
- https://github.com/math-comp/math-comp.git
- https://proofgeneral.github.io/

## 参考
- https://staff.aist.go.jp/reynald.affeldt/ssrcoq/install.html
- https://staff.aist.go.jp/reynald.affeldt/ssrcoq/ssrcoq.pdf
- http://next49.hatenadiary.jp/entry/20180508/1525777618
