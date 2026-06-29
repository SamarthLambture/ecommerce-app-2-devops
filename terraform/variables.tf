variable "env" {
    type = string
    default = "dev"
}

variable "instance_type" {
    type = string
    default = "t3.medium"
}

variable "volume_size" {
    type = number
    default = 29
}

variable "volume_type" {
    type = string
    default = "gp3"
}

variable "key_name" {
    type = string
    default = "expenses-tracker-key"
}

variable "public_key_path" {
    type = string
    default = "/home/samarth/.ssh/id_ed25519.pub"
}

variable "ami_id" {
    type = string
    default = "ami-024ebedf48d280810"
}