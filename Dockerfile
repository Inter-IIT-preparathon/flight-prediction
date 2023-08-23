# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip virtualenv

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install virtualenv and create a virtual environment named ENV
RUN pip3 install virtualenv && \
    virtualenv ENV

# Activate the virtual environment and install project dependencies
RUN /bin/bash -c "source ENV/bin/activate && pip install -r requirements.txt"

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run app.py when the container launches
CMD ["/bin/bash", "-c", "source ENV/bin/activate && python app.py"]

