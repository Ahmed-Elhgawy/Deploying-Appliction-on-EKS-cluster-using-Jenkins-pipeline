# Deploy EFS Storage driver

`kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"`

## Open jenkins UI

`kubectl port-forward -n jenkins <podname> 8080`