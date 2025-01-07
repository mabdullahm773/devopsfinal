# Use the official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the Python script into the container
COPY file.py .

# Define the default command
CMD ["python", "hello_world.py"]
