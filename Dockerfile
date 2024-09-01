# Use an official Alpine Linux as a base image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /application

# Install Poetry
RUN pip install poetry

# Copy the src and scripts into the container
COPY db ./db
COPY tests ./tests
COPY src ./src
COPY pyproject.toml ./pyproject.toml

# Install dependencies using Poetry
RUN poetry install

# Run tests with pytest and start up
CMD poetry run pytest ./tests -x -o log_cli=true --disable-warnings -vvv && poetry run fastapi dev --host 0.0.0.0 --port 3000 src/sample_api/main.py
