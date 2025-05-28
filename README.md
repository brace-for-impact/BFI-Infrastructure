# BFI-Infrastructure

Infrastructure setup for the BFI project using Docker Compose.

## 🚀 Deploy Instructions

### Prerequisites

- Docker & Docker Compose installed
- `.env.development`, `.env.staging`, and `.env.production` files present in the root

### Usage

To deploy for a specific environment:

```bash
./deploy.sh [development|staging|production]
