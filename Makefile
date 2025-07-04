TF_PLAN :=../tfplan/tfplan
TF_VARS :=../tfvars/terraform.tfvars

tf-init:
	terraform -chdir=terraform init -upgrade
tf-plan:
	terraform -chdir=terraform plan -var-file=$(TF_VARS) -out=$(TF_PLAN)
tf-apply:
	terraform -chdir=terraform apply $(TF_PLAN)
tf-fmt:
	terraform -chdir=terraform fmt -recursive
