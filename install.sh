#!/bin/bash

# Check if Docker is requested
if [ "$1" = "docker" ]; then
    echo "Setting up Docker environment..."
    
    # Check if Docker is installed
    if ! command -v docker &> /dev/null; then
        echo "Installing Docker..."
        brew install --cask docker
        echo "Please start Docker Desktop and run this script again."
        exit 1
    fi
    
    # Build Docker image
    echo "Building Jekyll Docker image..."
    docker build -t shivvrat-jekyll .
    
    echo "Docker setup complete!"
    echo "Usage:"
    echo "  ./docker-jekyll.sh dev    - Start development server"
    echo "  ./docker-jekyll.sh run    - Start production server"
    echo "  ./docker-jekyll.sh stop   - Stop server"
    echo "  ./docker-jekyll.sh shell  - Open container shell"
    exit 0
fi

# Local Ruby setup
echo "Setting up local Ruby environment..."

# Install chruby and ruby-install
brew install chruby ruby-install

# Install Ruby 3.2.3
ruby-install ruby 3.2.3

# Source chruby to use the new Ruby
source /opt/homebrew/share/chruby/chruby.sh
chruby ruby-3.2.3

# Install compatible Bundler version
gem install bundler

# Install Jekyll dependencies
bundle install

echo "Local setup complete! Ruby 3.2.3 and Jekyll are ready."
echo "To use Ruby 3.2.3 in future sessions, add this to your ~/.zshrc:"
echo "source /opt/homebrew/share/chruby/chruby.sh"
echo "chruby ruby-3.2.3"
echo ""
echo "For Docker setup, run: ./install.sh docker"
