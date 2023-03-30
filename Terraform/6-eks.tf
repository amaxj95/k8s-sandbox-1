resource "aws_iam_role" "k8s-sandbox" {
  name = "k8s-sandbox-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "k8s-sandbox-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::770662781733:role/k8s-sandbox-clusterRole"
  role       = aws_iam_role.k8s-sandbox.name
}

resource "aws_eks_cluster" "k8s-sandbox" {
  name     = "k8s-sandbox"
  role_arn = aws_iam_role.k8s-sandbox.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-us-east-1a.id,
      aws_subnet.private-us-east-1b.id,
      aws_subnet.public-us-east-1a.id,
      aws_subnet.public-us-east-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.k8s-sandbox-AmazonEKSClusterPolicy]
}
