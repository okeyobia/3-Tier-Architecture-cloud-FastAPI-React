# 3-Tier Architecture FastAPI + React Cloud Project

This project is a full-stack, cloud-ready application using a 3-tier architecture:
- **Backend:** FastAPI (Python) with SQLAlchemy and SQLite/PostgreSQL
- **Frontend:** React (Vite)
- **Infrastructure:** Provisioned with Terraform for AWS (ECS, RDS, S3, CloudFront, etc.)

## Project Structure

```
backend/    # FastAPI app, database models, API endpoints, Dockerfile
frontend/   # React app, API integration, Dockerfile
terraform/  # Infrastructure as code (modular, remote state, AWS)
```

## Quick Start

1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   cd 3-Tier-Architecture-FastAPI-React-cloud
   ```
2. **Backend:**
   - See `backend/README.md` for setup, running, and testing instructions.
3. **Frontend:**
   - See `frontend/README.md` for setup and running instructions.
4. **Infrastructure:**
   - See `terraform/README.md` and `terraform/QUICKSTART.md` for provisioning cloud resources.

## Development
- Use Docker for local development (see Dockerfiles in backend and frontend).
- Use `.env` files for environment variables.
- Automated tests are in `backend/tests/`.

## Deployment
- Infrastructure is managed via Terraform (see `terraform/` folder).
- Backend and frontend are containerized for deployment to AWS ECS or similar.

## Best Practices
- Modular Terraform code for reusability and clarity.
- Remote state with S3 and DynamoDB for safe collaboration.
- Environment-based configuration for backend and frontend.
- .gitignore and .terraformignore for clean version control.

## License
MIT (or specify your license)

---
For detailed setup and troubleshooting, see the respective README files in each folder.