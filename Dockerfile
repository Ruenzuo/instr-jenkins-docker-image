FROM jenkins/jenkins:lts
COPY --chown=jenkins:jenkins jenkins_home /var/jenkins_home
