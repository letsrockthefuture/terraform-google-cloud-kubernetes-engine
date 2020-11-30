clean:
	@echo "Deleting Terraform resources..."
	terraform destroy -auto-approve
