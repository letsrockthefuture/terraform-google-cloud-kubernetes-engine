# terraform-google-cloud-kubernetes-engine (2nd)

terraform-google-cloud-kubernetes-engine is our Terraform module that provides Kubernetes Engine infrastructure on Google Cloud, and that was developed following the infrastructure standard as code using Terraform.

## Usage

Set the project ID from your Google Cloud project:

```bash
export PROJECT_ID=YOUR_PROJECT_ID
export TF_VAR_project=$PROJECT_ID

gcloud config set project $PROJECT_ID
gcloud auth application-default login
```

Initializing Terraform and applying it's settings:

```bash
terraform init
terraform apply
```

To clean:

```bash
make clean
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
