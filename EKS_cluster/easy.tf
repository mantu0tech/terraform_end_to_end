module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "demo-eks"
  cluster_version = "1.35"

  # Use default VPC (simplest for demo)
  vpc_id = "vpc-0950a5855126997eb"
  subnet_ids = ["subnet-077764e0235e92188","subnet-01f9074c2b95efe95","subnet-0a31d78520d804e97"]

  # Enable public access (for testing)
  cluster_endpoint_public_access = true

  # Node group config
  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t2.medium"]
    }
  }
}
