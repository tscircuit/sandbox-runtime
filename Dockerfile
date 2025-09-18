ARG BUN_VERSION=1.2.22
FROM oven/bun:${BUN_VERSION}-slim as base

LABEL fly_launch_runtime="Bun"

# Bun app lives here
WORKDIR /app

# Set production environment
ENV NODE_ENV="production"

FROM base as build

# Install packages needed to build node modules
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential pkg-config python-is-python3 curl dumb-init

COPY . .

RUN bun install

EXPOSE 3100
CMD ["dumb-init", "--", "/bin/bash", "./scripts/entrypoint.sh"]
