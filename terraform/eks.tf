resource "null_resource" "eks-connection" {
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    working_dir = "../"
    command     = <<EOT
        sed -i "s/efs_volume_id/${module.storage.efs_id}/g" jenkins/jenkins-master/values.yaml

        # Connect to eks cluster
        aws eks update-kubeconfig --region ${var.region} --name ${module.cluster.cluster_id}
        
        # install efs-csi driver as deamanset
        kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"
    EOT
  }

  depends_on = [module.cluster]
}