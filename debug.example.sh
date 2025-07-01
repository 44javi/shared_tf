# set the subscription
export ARM_SUBSCRIPTION_ID="hidden"

# set the project / environment
export TF_VAR_project="management"
export TF_VAR_environment="prod"

# set the backend
export BACKEND_RESOURCE_GROUP="rg-management-prod"
export BACKEND_STORAGE_ACCOUNT="stljkasdfjlkasf"
export BACKEND_STORAGE_CONTAINER="terraform-state"
export BACKEND_KEY=$TF_VAR_project-$TF_VAR_environment

# run terraform
terraform init \
    -backend-config="resource_group_name=${BACKEND_RESOURCE_GROUP}" \
    -backend-config="storage_account_name=${BACKEND_STORAGE_ACCOUNT}" \
    -backend-config="container_name=${BACKEND_STORAGE_CONTAINER}" \
    -backend-config="key=${BACKEND_KEY}" \
    -reconfigure

terraform $* -var-file=./env/${TF_VAR_environment}.tfvars

# clean up the local environment
rm -rf .terraform