TF_PLAN=../plan/tfplan
TF_STATE=../state/terraform.tfstate
TF_VARS=../vars/terraform.tfvars

tf-init:
	terraform -chdir=terraform init
tf-plan:
	terraform -chdir=terraform plan -var-file=$(TF_VARS) -state=$(TF_STATE) -out=$(TF_PLAN)
tf-apply:
	terraform -chdir=terraform apply -state=$(TF_STATE) $(TF_PLAN)
