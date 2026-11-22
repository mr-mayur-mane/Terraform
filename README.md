## Local AWS setup using floci

Floci docker compose file

``` bash
services:
  floci:
    image: floci/floci:latest
    container_name: floci
    ports:
      - "4566:4566"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data
    environment:
      FLOCI_HOSTNAME: floci
      FLOCI_BASE_URL: http://floci:4566
      FLOCI_SERVICES_UI_IMAGE: ghcr.io/ofsazib/floci-dash:latest
      FLOCI_SERVICES_UI_CONTAINER_NAME: floci-dash
      FLOCI_SERVICES_UI_ENDPOINT_ENV: FLOCI_URL
      FLOCI_SERVICES_UI_STATUS_PATH: /api/healthz
```

Access the floci at
```bash
http://localhost:4566
```

## Local Environment Setup

Before running the project locally, export the following AWS environment variables in your terminal:

```bash
export AWS_ENDPOINT_URL=http://0.0.0.0:4566
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1
```
