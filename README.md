# MLOps Production System 🚀

> **A 2-year journey from Python Backend Developer to MLOps + CV + DE Engineer**

This repository documents my career transition into MLOps, Computer Vision, and Data Engineering through 3 progressive production-ready projects.

## 🎯 Vision

Transform from a Python backend developer (FastAPI, Django, ETL) into a full-stack ML engineer capable of building, deploying, and maintaining production ML systems with CV and DE components.

**Timeline:** 24 months | **Projects:** 3 | **Technologies:** 20+

## 📊 2-Year Roadmap

### Project 1: CV Classification System (Months 1-6)
**Goal:** Build foundational MLOps skills with computer vision

**Tech Stack:**
- **ML/CV:** PyTorch, torchvision, OpenCV
- **MLOps:** MLflow (experiment tracking, model registry)
- **Backend:** FastAPI (model serving)
- **Infrastructure:** Docker
- **Monitoring:** Basic logging with Loguru

**Deliverables:**
- Image classification model (e.g., product categorization)
- Experiment tracking with MLflow
- REST API for inference
- Dockerized application
- Basic monitoring and logging

---

### Project 2: Real-time ML + DE Pipeline (Months 7-15)
**Goal:** Add data engineering and advanced MLOps capabilities

**Tech Stack:**
- **DE:** Airflow/Prefect (orchestration), DVC (data versioning)
- **Feature Store:** Feast or custom implementation
- **MLOps:** Model versioning, CI/CD with GitHub Actions
- **Monitoring:** Prometheus + Grafana
- **Database:** PostgreSQL, Redis (caching)

**Deliverables:**
- Real-time data pipeline with feature engineering
- Automated model retraining pipeline
- Feature store for ML features
- CI/CD pipeline for ML code
- Advanced monitoring dashboards

---

### Project 3: Production-Ready CV + DE System (Months 16-24)
**Goal:** Build enterprise-grade ML system with full-stack capabilities

**Tech Stack:**
- **Orchestration:** Kubernetes (deployment, scaling)
- **Frontend:** React (monitoring dashboard)
- **Advanced MLOps:** A/B testing, shadow deployments
- **Cloud:** AWS/GCP (optional, for deployment)
- **Observability:** Full stack monitoring, alerting

**Deliverables:**
- Kubernetes-deployed ML system
- A/B testing framework for model comparison
- Auto-retraining with drift detection
- React dashboard for monitoring and management
- Complete documentation and portfolio presentation

## 🛠️ Technology Stack Progression

| Category | Project 1 | Project 2 | Project 3 |
|----------|-----------|-----------|-----------|
| **ML/CV** | PyTorch, OpenCV | + Transfer Learning | + Advanced architectures |
| **MLOps** | MLflow | + DVC, Model Registry | + A/B Testing, Drift Detection |
| **DE** | Basic ETL | Airflow, Feature Store | + Real-time streaming |
| **Backend** | FastAPI | + Async workers | + Microservices |
| **Infrastructure** | Docker | + Docker Compose | Kubernetes |
| **Frontend** | - | - | React Dashboard |
| **Monitoring** | Logging | Prometheus, Grafana | + Alerting, Tracing |
| **CI/CD** | - | GitHub Actions | + Advanced pipelines |

## 🚀 Quick Start

### Prerequisites
- Python 3.10+
- Git
- Docker (for later projects)

### Setup

```bash
# Clone repository
git clone https://github.com/Mytiaiev/mlops-production-system.git
cd mlops-production-system

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
pip install -r requirements-dev.txt

# Verify installation
python -c "import torch; import mlflow; import fastapi; print('✅ Setup complete!')"
```

### Using Makefile

```bash
make help          # Show available commands
make setup         # Setup environment
make test          # Run tests
make lint          # Run code quality checks
make format        # Format code
```

## 📚 Learning Resources

Detailed learning resources are tracked in [issues/learning-resources.md](issues/learning-resources.md).

**Key Resources:**
- 📖 **Books:** "Designing Machine Learning Systems" (Chip Huyen), "Building ML Powered Applications" (Emmanuel Ameisen)
- 🎓 **Courses:** MLOps Zoomcamp, Full Stack Deep Learning, FastAPI course
- 📺 **YouTube:** Weights & Biases, MLOps Community, ArjanCodes
- 📝 **Blogs:** Made With ML, Neptune.ai blog, MLOps.community

## 📁 Project Structure

```
mlops-production-system/
├── data/                    # Datasets (gitignored, managed by DVC)
├── models/                  # Trained models (gitignored)
├── notebooks/               # Jupyter notebooks for experiments
├── src/
│   ├── api/                # FastAPI application
│   ├── cv/                 # Computer Vision models
│   ├── de/                 # Data Engineering pipelines
│   ├── training/           # Training scripts
│   ├── monitoring/         # Monitoring and logging
│   └── utils/              # Helper functions
├── tests/                   # Unit and integration tests
├── docker/                  # Dockerfiles
├── k8s/                     # Kubernetes manifests (Project 3)
├── .github/workflows/      # CI/CD pipelines
├── configs/                 # Configuration files
├── docs/                    # Documentation
├── frontend/                # React dashboard (Project 3)
└── issues/                  # GitHub issues and planning
```

## 🎯 Current Status

**Phase:** Foundation Setup (Week 1-2)  
**Progress:** Setting up project structure and documentation

See [ROADMAP.md](ROADMAP.md) for detailed quarterly milestones.

## 📋 Issues & Planning

All work is tracked through GitHub issues:
- [Foundation Setup](issues/00-foundation-setup.md)
- [Project 1: CV Classification](issues/01-project1-cv-classification.md)
- [Project 2: Real-time ML + DE](issues/02-project2-realtime-ml-de.md)
- [Project 3: Production System](issues/03-project3-production-system.md)

## 🏗️ Architecture

See [ARCHITECTURE.md](ARCHITECTURE.md) for detailed architecture decisions and system design.

## 🤝 Background

**Previous Experience:**
- Python backend development (FastAPI, Django)
- Banking applications and payment systems
- ETL processes in traffic arbitrage
- Mobile app development (task management system)

**Career Goal:**
Become a senior MLOps engineer with expertise in CV and DE, capable of building end-to-end ML systems from data pipelines to production deployment.

## 📈 Success Metrics

By the end of 24 months:
- ✅ 3 production-ready projects in portfolio
- ✅ Proficiency in 20+ MLOps/CV/DE technologies
- ✅ Complete CI/CD pipelines for ML systems
- ✅ Kubernetes deployment experience
- ✅ Full-stack ML application (backend + frontend)
- ✅ Ready for senior MLOps engineer positions

## 📝 License

MIT License - feel free to use this as a template for your own learning journey!

## 🔗 Connect

GitHub: [@Mytiaiev](https://github.com/Mytiaiev)

---

**Last Updated:** February 2026  
**Status:** 🟢 Active Development