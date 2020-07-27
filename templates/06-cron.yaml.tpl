# * * * * *  command to execute
# │ │ │ │ │
# │ │ │ │ │
# │ │ │ │ └───── day of week (0 - 6) (0 to 6 are Sunday to Saturday, or use names; 7 is Sunday, the same as 0)
# │ │ │ └────────── month (1 - 12)
# │ │ └─────────────── day of month (1 - 31)
# │ └──────────────────── hour (0 - 23)
# └───────────────────────── min (0 - 59)
#
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: kube-bench
spec:
  schedule: "15 7 * * 6"
  concurrencyPolicy: "Forbid"
  failedJobsHistoryLimit: 2
  startingDeadlineSeconds: 600 # 10 min
  jobTemplate:
    spec:
      backoffLimit: 0
      activeDeadlineSeconds: 3300 # 55min
      template:
        spec:
          containers:
            - name: kube-bench-crontab
              image: "012345678910.dkr.ecr.us-west-2.amazonaws.com/k8s/kube-bench:__KUBE_BENCH_VERSION__"
              command: ["kube-bench", "--version", "1.14"]
              args: [""]
          restartPolicy: Never
