# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Switch to the root user for installation
USER root

# Install additional tools
RUN apt-get update && apt-get install -y net-tools iputils-ping curl vim screen

# Install Docker inside the Jenkins image
RUN curl https://get.docker.com/ > /var/jenkins_home/dockerinstall \
    && chmod 777 /var/jenkins_home/dockerinstall \
    && ./var/jenkins_home/dockerinstall \
    && chmod 666 /var/run/docker.sock

# Switch back to the Jenkins user
USER jenkins

# Expose the Docker daemon socket to the Jenkins container
VOLUME /var/run/docker.sock

# Expose Jenkins home directory as a volume
VOLUME /var/jenkins_home

# Set the default command to start Jenkins
CMD ["/usr/local/bin/jenkins.sh"]

