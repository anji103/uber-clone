resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::060795910502:role/anji-role"  # Replace with your IAM role ARN

  vpc_config {
    subnet_ids         = ["subnet-03e6aaed9d64539fe", "subnet-0f73c0829609a5147"]  # Replace with your subnet IDs
    security_group_ids = ["sg-0a00b3e4ff192284b"]                         # Replace with your security group IDs
  }

  tags = {
    Environment = "Production"
  }
}

resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "my-node-group"
  node_role_arn   = "arn:aws:iam::060795910502:role/anji-role"  # Replace with your IAM role ARN
  subnet_ids         = ["subnet-03e6aaed9d64539fe", "subnet-0f73c0829609a5147"]      # Replace with your subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  tags = {
    Environment = "Production"
  }
}






    
    
  





