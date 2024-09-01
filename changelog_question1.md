# Changelog for question 1

## [Unreleased]
### Added
- root/Dockerfile (new file created for building Docker image in the Python project)

### Changed
- root/docker-compose.yml (Redefine housing-api definition by building Docker image using the newly created Dockerfile)

### Fixed
- root/pyproject.toml (Replace psycopg2 with psycopg2-binary to fix local build error)


## [0.1.0] - 2024-08-31
### Added
- Initial release
