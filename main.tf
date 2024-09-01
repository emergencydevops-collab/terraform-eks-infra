module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

  vpc_id     = aws_vpc.main.id
  subnet_ids = aws_subnet.public[*].id

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_size
      min_capacity     = var.min_size

      instance_type = var.instance_type
      key_name      = var.ssh_key_name

      additional_tags = {
        Name = "eks-node-group"
      }
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  count = 2
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  vpc_id     = aws_vpc.main.id
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  count = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
