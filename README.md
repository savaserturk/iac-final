# CST8918 Final Project – Terraform, Azure AKS, and GitHub Actions

## 👤 Team Member

- **Savas Erturk**  
  GitHub: [github.com/savaserturk](https://github.com/savaserturk)

---

## 📌 Project Overview

This project is a full DevOps deployment of the **Remix Weather Application** using:

- **Terraform** for infrastructure provisioning  
- **Azure Kubernetes Service (AKS)** for hosting the app  
- **Azure Container Registry (ACR)** for container image storage  
- **Azure Cache for Redis** for caching API responses  
- **GitHub Actions** for continuous integration and deployment (CI/CD)

The project includes multi-environment deployment (`test`, `prod`) with modular Terraform code and automated workflows triggered on GitHub events.

---

## 🧱 Infrastructure Modules

### ✔ Backend Configuration (remote state)
- Uses Azure Blob Storage as a remote backend for Terraform state files.
- Locked state for collaboration.

### ✔ Network Module
- Creates a virtual network (`10.0.0.0/14`) and 4 subnets:
  - `prod`: `10.0.0.0/16`
  - `test`: `10.1.0.0/16`
  - `dev`: `10.2.0.0/16`
  - `admin`: `10.3.0.0/16`

### ✔ AKS Module
- `test` cluster: 1 node, static size, Kubernetes `v1.32.0`
- `prod` cluster: autoscaling 1–3 nodes, Kubernetes `v1.32.0`
- System-assigned managed identity
- Configured to attach to ACR for image pulls

### ✔ Weather App Module
- Remix app Dockerized and deployed to each AKS cluster
- ACR (Azure Container Registry) created and integrated
- Redis Cache for both environments
- Kubernetes Deployment and LoadBalancer Service per environment

---

## ⚙️ CI/CD Workflows with GitHub Actions

### ✅ `docker-build-push.yml`
- **Builds and pushes Docker image** to test ACR on pull requests
- **Pushes to prod ACR** on direct push to `main` branch

### 🔄 Workflows To Add
- `terraform-static.yml`: Run fmt, validate, tfsec on any push
- `terraform-plan.yml`: Run tflint and terraform plan on PRs
- `terraform-apply.yml`: Apply infra changes when PR is merged
- `k8s-deploy.yml`: Deploy app to AKS on app code changes

---

## 📂 Repository Structure

```
.
├── remix-weather-final/
│   └── remix-weather-final/
│       ├── Dockerfile
│       └── app source files
├── modules/
│   ├── aks/
│   ├── network/
│   ├── backend/
│   └── weather_app/
├── .github/workflows/
│   ├── docker-build-push.yml
│   ├── terraform-static.yml (to add)
│   ├── terraform-plan.yml (to add)
│   ├── terraform-apply.yml (to add)
│   └── k8s-deploy.yml (to add)
├── main.tf
├── backend.tf
├── variables.tf
├── provider.tf
├── README.md
```

---

## ✅ Deployment Status

- [x] AKS clusters created (test and prod)
- [x] ACR integrated with clusters
- [x] Remix app deployed and running in both environments
- [x] Redis caching enabled
- [x] Terraform modules completed
- [x] GitHub Actions `docker-build-push.yml` working

---

## 📸 Submission Checklist

- [x] GitHub repo submitted on Brightspace
- [x] Professor `rlmckenney` added as collaborator
- [ ] Add screenshot of successful GitHub Action workflows
- [ ] Include all required workflows in `.github/workflows/`

---

## 🔥 Cleanup

To avoid unnecessary Azure charges, run:

```bash
terraform destroy
```

After confirming your deployment and submitting the project.

---

## 📜 License

This project is for educational purposes only as part of CST8918: DevOps – Infrastructure as Code.