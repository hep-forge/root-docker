# Docker Images with Matrix Support

## Purpose of the Docker Matrix

The goal of the Docker matrix is to simplify the creation, testing, and deployment of Docker images across multiple combinations of:

- Software versions
- Base operating systems (e.g., Ubuntu, CentOS)
- Dependencies (e.g., Python versions, libraries)
- Hardware architectures (e.g., x86_64, ARM64)

By automating these combinations, the repository ensures broad compatibility and flexibility, catering to diverse user needs and environments.

## How the Matrix Works

The repository uses a GitHub Actions workflow to dynamically define and build the Docker matrix. For each combination:

1. **Configuration**: Parameters like software version, OS type, and architecture are specified in the matrix.
2. **Dynamic Builds**: Only valid configurations are built, while unsupported combinations are skipped.
3. **Image Tagging**: Each image is tagged based on its configuration, making it easy to identify and use specific setups.

### Example Matrix Parameters
- **Software Version**: `1.0.0`, `2.1.3`
- **OS**: `ubuntu20.04`, `centos7`
- **Dependencies**: `Python 3.8`, `Python 3.9`
- **Architecture**: `amd64`, `arm64`

This matrix ensures comprehensive coverage while avoiding unnecessary builds.

## Usage

To pull and run a prebuilt image:

```bash
docker pull <repository-name>:<tag>
docker run -it <repository-name>:<tag>
```

## Licence

This repository is licensed under the MIT License. Please quote this repository if you use.
