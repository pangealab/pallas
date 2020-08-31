# pallas
Ubuntu base image for GitHub Actions with tools like AWS CLI, Kubectl and others

# Build Image

```
docker build -t pangealab/pallas:latest .
```

# Publish Image

```
docker login -u YOURUSERNAME
docker push pangealab/pallas:latest
```
