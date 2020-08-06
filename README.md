# OPS NOTE 
## REFER TO UPDATED OFFICIAL KUBE-BENCH DOCS IN THE PUBLIC REPO:
#### ref: https://github.com/aquasecurity/kube-bench
#### The info doc below will get out of date but serves for our infrastructure code deployment purposes.

## USAGE TL;DR:

### set desired kube-bench variables in the $ENV-terraform.tfvars

### build
```console
./build 
```
### apply and deploy nightly cron job
```console
./apply
```

### get cron logs (from nightly jobs)
```console
k logs -f job.batch/kube-bench -n default | grep -A 5 'Summary'
== Summary ==
16 checks PASS
7 checks FAIL
2 checks WARN
0 checks INFO
```

```console
k logs -f job.batch/kube-bench -n default | grep 'FAIL'
[FAIL] 2.1.1 Ensure that the --allow-privileged argument is set to false (Scored)
[FAIL] 2.1.5 Ensure that the --read-only-port argument is set to 0 (Scored)
[FAIL] 2.1.7 Ensure that the --protect-kernel-defaults argument is set to true (Scored)
[FAIL] 2.1.10 Ensure that the --event-qps argument is set to 0 (Scored)
[FAIL] 2.1.11 Ensure that the --tls-cert-file and --tls-private-key-file arguments are set as appropriate (Scored)
[FAIL] 2.2.5 Ensure that the proxy kubeconfig file permissions are set to 644 or more restrictive (Scored)
[FAIL] 2.2.6 Ensure that the proxy kubeconfig file ownership is set to root:root (Scored)
7 checks FAIL
```

### Fetch metadata within DataDog, etc.
- Results can also be obtained by running the commands above or 
- `./scripts/kube-bench-report`


## REFER TO UPDATED OFFICIAL KUBE-BENCH DOCS IN THE PUBLIC REPO:
- ref: https://github.com/aquasecurity/kube-bench

Table of Contents
=================

- [OPS NOTE](#myco-ops-note)
  - [REFER TO UPDATED OFFICIAL KUBE-BENCH DOCS IN THE PUBLIC REPO:](#refer-to-updated-official-kube-bench-docs-in-the-public-repo)
      - [ref: https://github.com/aquasecurity/kube-bench](#ref-httpsgithubcomaquasecuritykube-bench)
      - [The info doc below will get out of date but serves for our infrastructure code deployment purposes.](#the-info-doc-below-will-get-out-of-date-but-serves-for-our-infrastructure-code-deployment-purposes)
  - [USAGE TL;DR:](#terradatum-usage-tldr)
    - [set desired kube-bench variables in the $ENV-terraform.tfvars](#set-desired-kube-bench-variables-in-the-env-terraformtfvars)
    - [build](#build)
    - [apply and deploy nightly cron job](#apply-and-deploy-nightly-cron-job)
    - [get cron logs (from nightly jobs)](#get-cron-logs-from-nightly-jobs)
    - [Fetch metadata within DataDog, etc.](#fetch-metadata-within-datadog-etc)
  - [REFER TO UPDATED OFFICIAL KUBE-BENCH DOCS IN THE PUBLIC REPO:](#for-all-below-refer-to-updated-official-kube-bench-docs-in-the-public-repo)
- [Table of Contents](#table-of-contents)
  - [CIS Kubernetes Benchmark support](#cis-kubernetes-benchmark-support)
