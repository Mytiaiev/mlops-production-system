# Architecture & Technical Decisions

## Overview

This document outlines the architectural decisions, technology choices, and design principles for the MLOps Production System. The architecture evolves across 3 projects, growing from a simple prototype to a production-ready system.

## Design Principles

### 1. MLOps-First Approach
**Decision:** Build with MLOps practices from day one, not as an afterthought.

**Rationale:**
- Experiment tracking prevents lost work and enables reproducibility
- Model versioning is critical for production deployments
- Monitoring and logging are essential for debugging ML systems
- CI/CD ensures consistent deployments

**Implementation:**
- MLflow from Project 1 for experiment tracking
- DVC for data versioning (Project 2)
- Automated testing and deployment pipelines (Project 2+)

### 2. Modular Architecture
**Decision:** Separate concerns into distinct modules (CV, DE, API, Training).

**Rationale:**
- Easier to test individual components
- Enables parallel development of features
- Simplifies scaling (can deploy components independently)
- Follows software engineering best practices

**Structure:**
```
src/
├── api/          # FastAPI endpoints (serving layer)
├── cv/           # Computer Vision models and preprocessing
├── de/           # Data Engineering pipelines
├── training/     # Training scripts and experiment code
├── monitoring/   # Logging, metrics, alerting
└── utils/        # Shared utilities
```

### 3. Configuration-Driven Development
**Decision:** Use YAML configs for all hyperparameters, paths, and settings.

**Rationale:**
- No hardcoded values in code
- Easy to experiment with different configurations
- Enables config versioning alongside code
- Simplifies deployment to different environments

**Example:**
```yaml
# configs/training.yaml
model:
  architecture: resnet50
  pretrained: true
  num_classes: 10

training:
  batch_size: 32
  epochs: 50
  learning_rate: 0.001
```

### 4. Containerization from Start
**Decision:** Dockerize all components early (Project 1).

**Rationale:**
- Ensures reproducibility across environments
- Simplifies deployment
- Prepares for Kubernetes (Project 3)
- Industry standard for ML deployment

## System Architecture Evolution

### Project 1: Monolithic ML Application

```
┌─────────────────────────────────────┐
│         Docker Container            │
│  ┌──────────────────────────────┐  │
│  │      FastAPI Server          │  │
│  │  ┌────────────────────────┐  │  │
│  │  │  CV Model (PyTorch)    │  │  │
│  │  │  - Preprocessing       │  │  │
│  │  │  - Inference           │  │  │
│  │  └────────────────────────┘  │  │
│  └──────────────────────────────┘  │
│                                     │
│  ┌──────────────────────────────┐  │
│  │      MLflow Tracking         │  │
│  │  - Experiments               │  │
│  │  - Model Registry            │  │
│  └──────────────────────────────┘  │
└─────────────────────────────────────┘
```

**Characteristics:**
- Single Docker container
- Simple deployment
- Local MLflow tracking
- Synchronous inference

### Project 2: Microservices with Data Pipeline

```
┌──────────────────────────────────────────────────────┐
│                  Orchestration Layer                  │
│              (Airflow/Prefect)                        │
└──────────────────────────────────────────────────────┘
         │                    │                    │
         ▼                    ▼                    ▼
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│  Data Pipeline  │  │  Training       │  │  Serving API    │
│                 │  │  Pipeline       │  │                 │
│  - Ingestion    │  │  - Feature Eng  │  │  - FastAPI      │
│  - Validation   │  │  - Training     │  │  - Model Load   │
│  - Transform    │  │  - Evaluation   │  │  - Inference    │
└─────────────────┘  └─────────────────┘  └─────────────────┘
         │                    │                    │
         ▼                    ▼                    ▼
┌──────────────────────────────────────────────────────┐
│              Shared Infrastructure                    │
│  ┌──────────┐  ┌──────────┐  ┌──────────────────┐   │
│  │ Feature  │  │  Model   │  │  Monitoring      │   │
│  │  Store   │  │ Registry │  │  (Prometheus)    │   │
│  └──────────┘  └──────────┘  └──────────────────┘   │
└──────────────────────────────────────────────────────┘
```

**Characteristics:**
- Separate services for data, training, serving
- Centralized feature store
- Automated pipelines
- Monitoring and alerting

### Project 3: Production Kubernetes Deployment

```
┌────────────────────────────────────────────────────────────┐
│                    Kubernetes Cluster                       │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Ingress Controller                       │  │
│  └──────────────────────────────────────────────────────┘  │
│           │                              │                  │
│           ▼                              ▼                  │
│  ┌─────────────────┐          ┌─────────────────────────┐  │
│  │  React Frontend │          │   API Gateway           │  │
│  │  (Dashboard)    │          │   - Load Balancing      │  │
│  └─────────────────┘          │   - A/B Testing         │  │
│                                └─────────────────────────┘  │
│                                          │                  │
│                    ┌─────────────────────┼──────────────┐   │
│                    ▼                     ▼              ▼   │
│         ┌──────────────────┐  ┌──────────────┐  ┌──────────┐
│         │  Model A (v1.2)  │  │ Model B (v2) │  │ Batch    │
│         │  - Deployment    │  │ - Canary     │  │ Inference│
│         │  - HPA enabled   │  │ - 10% traffic│  │          │
│         └──────────────────┘  └──────────────┘  └──────────┘
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Background Services                      │  │
│  │  ┌────────────┐  ┌────────────┐  ┌────────────────┐  │  │
│  │  │  Airflow   │  │  Training  │  │  Drift         │  │  │
│  │  │  Scheduler │  │  Workers   │  │  Detection     │  │  │
│  │  └────────────┘  └────────────┘  └────────────────┘  │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │              Observability Stack                      │  │
│  │  ┌────────────┐  ┌────────────┐  ┌────────────────┐  │  │
│  │  │ Prometheus │  │  Grafana   │  │  Alertmanager  │  │  │
│  │  └────────────┘  └────────────┘  └────────────────┘  │  │
│  └──────────────────────────────────────────────────────┘  │
└────────────────────────────────────────────────────────────┘
```

**Characteristics:**
- Full Kubernetes orchestration
- A/B testing and canary deployments
- Auto-scaling based on load
- Complete observability
- React dashboard for management

## Technology Stack Rationale

### ML/CV: PyTorch
**Why PyTorch over TensorFlow?**
- More Pythonic and easier to debug
- Better for research and experimentation
- Strong CV ecosystem (torchvision, timm)
- Industry momentum in CV domain

### MLOps: MLflow
**Why MLflow?**
- Open-source and vendor-neutral
- Covers experiment tracking, model registry, deployment
- Easy to start with, scales to production
- Strong community and integrations

### Backend: FastAPI
**Why FastAPI over Flask/Django?**
- Async support (critical for ML inference)
- Automatic API documentation (OpenAPI/Swagger)
- Type hints and validation (Pydantic)
- High performance (comparable to Node.js)
- Already familiar from previous work

### Orchestration: Airflow/Prefect
**Why Airflow?**
- Industry standard for data pipelines
- Rich ecosystem of operators
- Good for scheduled batch jobs
- Strong monitoring and alerting

**Alternative: Prefect** (more modern, better for ML workflows)

### Infrastructure: Docker → Kubernetes
**Progression rationale:**
- Docker first: Learn containerization basics
- Kubernetes later: Production-grade orchestration
- Aligns with industry practices

### Frontend: React
**Why React?**
- Most popular frontend framework
- Large ecosystem and community
- Good for dashboards (with libraries like Recharts)
- Valuable skill for full-stack ML engineers

## Data Flow

### Training Pipeline
```
Raw Data → Validation → Preprocessing → Feature Engineering → Training → Evaluation → Model Registry
                                                                              ↓
                                                                         MLflow Tracking
```

### Inference Pipeline
```
Request → API Gateway → Preprocessing → Model Inference → Post-processing → Response
                                              ↓
                                        Monitoring/Logging
```

### Retraining Pipeline
```
Drift Detection → Trigger Retraining → Data Pipeline → Training → Evaluation → A/B Test → Deployment
```

## Scalability Considerations

### Horizontal Scaling
- **API servers:** Multiple replicas behind load balancer
- **Training:** Distributed training with PyTorch DDP (Project 3)
- **Data processing:** Parallel workers in Airflow

### Vertical Scaling
- **GPU support:** CUDA-enabled containers for training
- **Memory:** Efficient data loading with PyTorch DataLoader
- **Storage:** DVC for large datasets (avoid Git LFS)

### Caching Strategy
- **Model caching:** Load model once, serve multiple requests
- **Feature caching:** Redis for frequently accessed features
- **Response caching:** Cache predictions for identical inputs

## Security Considerations

### API Security
- Authentication with API keys (Project 1)
- OAuth2/JWT tokens (Project 2+)
- Rate limiting to prevent abuse
- Input validation with Pydantic

### Model Security
- Model versioning to track changes
- Access control for model registry
- Audit logs for model deployments

### Data Security
- No sensitive data in Git (use .gitignore)
- Environment variables for secrets (.env files)
- Encryption for data at rest (Project 3)

## Monitoring Strategy

### Application Metrics
- Request latency (p50, p95, p99)
- Throughput (requests/second)
- Error rates (4xx, 5xx)

### ML Metrics
- Model accuracy/F1 on validation set
- Prediction distribution (detect drift)
- Feature statistics (min, max, mean)

### Infrastructure Metrics
- CPU/Memory usage
- GPU utilization (during training)
- Disk I/O and network bandwidth

### Alerting
- Model performance degradation
- High error rates
- Infrastructure failures

## Testing Strategy

### Unit Tests
- Individual functions and classes
- Mock external dependencies
- Fast execution (<1 second per test)

### Integration Tests
- API endpoints with test client
- Database interactions
- Model loading and inference

### ML-Specific Tests
- Data validation (schema, ranges)
- Model performance on test set
- Prediction consistency (same input → same output)

### CI/CD Tests
- Linting (Ruff, Black)
- Type checking (mypy)
- Security scanning (Bandit)
- Automated tests on every PR

## Future Enhancements

### Potential Additions (Beyond 24 months)
- **Streaming ML:** Real-time predictions with Kafka
- **AutoML:** Automated hyperparameter tuning
- **Explainability:** SHAP/LIME for model interpretability
- **Multi-model serving:** Ensemble predictions
- **Edge deployment:** TensorRT/ONNX for mobile/edge devices

## References

- [MLOps Principles](https://ml-ops.org/content/mlops-principles)
- [Google's ML Engineering Best Practices](https://developers.google.com/machine-learning/guides/rules-of-ml)
- [Designing Machine Learning Systems (Chip Huyen)](https://www.oreilly.com/library/view/designing-machine-learning/9781098107956/)

---

**Last Updated:** February 2026  
**Version:** 1.0
