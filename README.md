# S3 Hosting Using OIDC with Terraform

This repository demonstrates how to deploy a static website on Amazon S3 using Terraform and configure GitHub Actions with OIDC authentication to securely interact with AWS resources.

## Overview

- **AWS S3**: We will host a static website using an S3 bucket.
- **OIDC Authentication**: We will use **GitHub OIDC** to securely authenticate GitHub Actions with AWS.
- **Terraform**: Terraform will be used to provision the necessary AWS resources.
- **GitHub Actions**: GitHub Actions will automate the deployment of the website.

## Requirements

### Tools

- **Terraform**: Version 1.0 or higher
- **AWS CLI**: Version 2.0 or higher
- **GitHub Actions**: Automated CI/CD for deployment

### AWS Permissions

Ensure you have the necessary AWS IAM roles and policies to interact with S3 and assume roles via OIDC authentication.

- **GitHub Actions OIDC Role**: Terraform will create the role that GitHub Actions can assume.
- **S3 Bucket Policy**: Ensure the bucket policy allows access to the actions from GitHub.

### GitHub Secrets

Make sure you have the following GitHub secrets set up in your repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_ACCOUNT_ID`
- `AWS_REGION`

## Steps

### 1. Set up Terraform

1. Clone this repository:

   ```bash
   git clone https://github.com/stackcouture/s3-hosting-using-oidc-terraform.git
   cd s3-hosting-using-oidc-terraform

## 2. Initialize Terraform

Run the following command to initialize the Terraform configuration. This will download the necessary provider plugins and prepare Terraform to manage your AWS resources:

    terraform init

## 3. Review the Terraform plan

Before applying changes, you can review the execution plan to see which actions Terraform will take. This command will output a summary of what will happen when you apply the configuration, including which resources will be created or modified:
    
    terraform plan

## 4. Apply the Terraform plan

Once you're satisfied with the plan, apply it to create the necessary AWS resources (S3 bucket and IAM roles). Terraform will prompt you to confirm before creating the resources. Type yes to proceed:

    terraform apply

After applying the Terraform configuration, your S3 bucket and IAM roles will be provisioned. The S3 bucket will be configured to host your static website.




## Steps to Add AWS Account ID to GitHub Secrets

### 1. Find your AWS Account ID:
You can find your AWS account ID by navigating to the **AWS Management Console** > **IAM** > **Dashboard**. Your account ID will be displayed in the top-right corner.

### 2. Add the AWS Account ID to GitHub Secrets:
1. Go to your **GitHub repository**.
2. Click on the **Settings** tab of the repository.
3. In the left sidebar, scroll down and click on **Secrets and variables** > **Actions**.
4. Click on **New repository secret**.
5. Name the secret `AWS_ACCOUNT_ID`.
6. In the **Value** field, paste your **AWS Account ID**.
7. Click **Add secret**.


## GitHub Actions Output

### Triggering the Action:
The GitHub Actions workflow will run automatically whenever you push changes to your repository (or based on the trigger you've set, like a push to the `main` branch).

### Viewing the Output:
Once the workflow starts running, you can view the progress and output of each step in real-time from within GitHub’s interface.

1. Navigate to the **Actions** tab of your repository on GitHub.
2. Select the workflow run that you want to inspect.
3. You will see the logs for each step of the GitHub Actions workflow (like **Checkout Code**, **Configure AWS Credentials**, **Sync Website to S3**, etc.).

### Logs for Each Step:
GitHub automatically generates logs for every step of the action.

- If there is an error in a specific step, GitHub will display the logs with error details so you can troubleshoot.
- You can click on any specific step to expand it and see detailed output.

#### Example Workflow Run Output:
- **Checkout Code**: Confirmation that the code has been cloned and the correct branch checked out.
- **Configure AWS Credentials**: Logs confirming that AWS credentials are set up properly.
- **Sync Website to S3**: Logs for `aws s3 sync` showing whether the website was successfully uploaded to S3 or if any error occurred.
- **Final URL**: The URL of the live static website hosted on S3.

---

