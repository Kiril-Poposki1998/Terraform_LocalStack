resource "aws_eks_cluster" "cluster_default" {
  name     = "cluster_default"
  role_arn = aws_iam_role.role.arn

  vpc_config {
    subnet_ids = [aws_subnet.main.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_node_group" "node_gr_1" {
  cluster_name    = aws_eks_cluster.cluster_default.name
  node_group_name = "node_gr_1"
  node_role_arn   = aws_iam_role.role.arn
  subnet_ids      = [aws_subnet.main.id]
  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }
}

output "endpoint" {
  value = aws_eks_cluster.cluster_default.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster_default.certificate_authority[0].data
}