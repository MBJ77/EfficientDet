# Use an official Python runtime based on Debian 10 "buster" as a parent image
FROM python:3.9-buster

# Metadata indicating the maintainer of the image
LABEL maintainer="yourname@example.com"

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Update the system and install pip
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y python3-pip

# Install any needed packages specified in requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install tensorflow
RUN pip3 install pandas
RUN pip3 install numpy
RUN pip3 install opencv-python-headless
RUN pip3 install matplotlib

# Install keras-applications for EfficientDet
RUN pip3 install git+https://github.com/keras-team/keras-applications.git

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.py when the container launches
CMD ["python", "app.py"]
