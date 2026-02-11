.PHONY: help setup install install-dev test lint format clean run-api run-mlflow docker-build

help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

setup:  ## Create virtual environment and install dependencies
	python -m venv venv
	@echo "Virtual environment created. Activate with: source venv/bin/activate"
	@echo "Then run: make install"

install:  ## Install production dependencies
	pip install --upgrade pip
	pip install -r requirements.txt

install-dev:  ## Install development dependencies
	pip install --upgrade pip
	pip install -r requirements.txt -r requirements-dev.txt
	pre-commit install

test:  ## Run tests with coverage
	pytest tests/ -v --cov=src --cov-report=html --cov-report=term

test-fast:  ## Run tests without coverage
	pytest tests/ -v

lint:  ## Run linting checks
	ruff check src/ tests/
	mypy src/
	black --check src/ tests/

format:  ## Format code with black and isort
	black src/ tests/
	isort src/ tests/
	ruff check --fix src/ tests/

clean:  ## Clean temporary files and caches
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".mypy_cache" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	rm -rf htmlcov/ .coverage

run-api:  ## Run FastAPI development server
	uvicorn src.api.main:app --reload --host 0.0.0.0 --port 8000

run-mlflow:  ## Run MLflow UI
	mlflow ui --host 0.0.0.0 --port 5000

docker-build:  ## Build Docker image
	docker build -t mlops-production-system:latest -f docker/Dockerfile .

docker-run:  ## Run Docker container
	docker run -p 8000:8000 mlops-production-system:latest

init:  ## Initialize project (first time setup)
	@echo "Initializing project..."
	mkdir -p data models notebooks logs
	touch src/__init__.py
	touch src/api/__init__.py
	touch src/cv/__init__.py
	touch src/de/__init__.py
	touch src/training/__init__.py
	touch src/monitoring/__init__.py
	touch src/utils/__init__.py
	@echo "Project initialized!"
