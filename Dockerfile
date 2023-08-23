# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install virtual environment
RUN pip install virtualenv

# Create and activate virtual environment
RUN virtualenv ENV
RUN . /app/ENV/bin/activate

# Install project dependencies
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]


