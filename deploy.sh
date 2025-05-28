#!/bin/bash

set -e

ENV="$1"

if [[ -z "$ENV" ]]; then
  echo "❌ Usage: ./deploy.sh [development|staging|production]"
  exit 1
fi

ENV_FILE=".env.${ENV}"
COMPOSE_FILE="docker-compose.${ENV}.yaml"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "❌ Env file '$ENV_FILE' not found"
  exit 1
fi

if [[ ! -f "$COMPOSE_FILE" ]]; then
  echo "❌ Compose file '$COMPOSE_FILE' not found"
  exit 1
fi

echo "📄 Copying $ENV_FILE to .env..."
cp "$ENV_FILE" .env

echo "🐳 Starting containers using $COMPOSE_FILE..."
docker-compose -f "$COMPOSE_FILE" --env-file .env up --build -d
