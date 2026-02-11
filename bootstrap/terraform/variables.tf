variable "project_name" {
  type        = string
  description = "Project name used for tagging"
  default     = "launchrail"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "launchrail-eks"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.40.0.0/16"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDRs"
  default     = ["10.40.0.0/20", "10.40.16.0/20"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDRs"
  default     = ["10.40.32.0/20", "10.40.48.0/20"]
}

variable "node_instance_types" {
  type        = list(string)
  description = "EKS managed node group instance types"
  default     = ["t3.medium"]
}

variable "node_min_size" {
  type        = number
  default     = 1
}

variable "node_max_size" {
  type        = number
  default     = 3
}

variable "node_desired_size" {
  type        = number
  default     = 2
}

variable "argocd_chart_version" {
  type        = string
  description = "Argo CD Helm chart version"
  default     = "6.7.13"
}

variable "argocd_namespace" {
  type        = string
  default     = "argocd"
}
