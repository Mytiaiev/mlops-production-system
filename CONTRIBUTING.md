# Contributing to MLOps Production System

Thank you for your interest in contributing! This is a learning project, but contributions are welcome.

## Development Setup

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/mlops-production-system.git
   cd mlops-production-system
   ```

3. Set up development environment:
   ```bash
   make setup
   source venv/bin/activate
   make install-dev
   ```

4. Create a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Code Standards

### Python Style
- Follow PEP 8
- Use Black for formatting: `make format`
- Use Ruff for linting: `make lint`
- Add type hints to all functions
- Maximum line length: 100 characters

### Testing
- Write tests for new features
- Maintain >80% test coverage
- Run tests before committing: `make test`

### Commits
- Use clear, descriptive commit messages
- Follow conventional commits format:
  - `feat:` new feature
  - `fix:` bug fix
  - `docs:` documentation changes
  - `test:` adding tests
  - `refactor:` code refactoring

Example:
```
feat: add image preprocessing pipeline

- Implement resize and normalization
- Add data augmentation transforms
- Update tests
```

## Pull Request Process

1. Update documentation if needed
2. Add tests for new functionality
3. Ensure all tests pass: `make test`
4. Ensure code is formatted: `make format`
5. Ensure linting passes: `make lint`
6. Update CHANGELOG.md (if applicable)
7. Submit PR with clear description

## Questions?

Open an issue for discussion before starting major changes.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
