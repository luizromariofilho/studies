#!/bin/bash
set -e

echo "## Setting up docker .env ..."
cp -v -n .env.example .env


echo "## Setting up database ..."
cp -v -n config/database.example.yml config/database.yml

echo "## Setting up Gemfile ..."
touch Gemfile.lock
