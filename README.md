# instr-jenkins-docker-image

Docker image based on jenkins/jenkins:lts that showcases instr usage. It contains a pipeline job configured to get the source code from [instr-ios-sample-app](https://github.com/Ruenzuo/instr-ios-sample-app) and run the [pipeline script](https://github.com/Ruenzuo/instr-ios-sample-app/blob/master/Jenkinsfile) hosted in the repository. The pipeline runs the tests, uses [instr](https://github.com/Ruenzuo/instrumentality) to run a performance benchmark and uses the [Jenkins Performance Plugin](https://plugins.jenkins.io/performance) to record the results.

### How to run it

#### Dependencies

* Environment capable of running [instr](https://github.com/Ruenzuo/instrumentality): macOS with SIP disabled.
* Docker
* Java 1.8 or higher

#### Instructions

1. Run the Jenkins server locally using Docker.

```
docker run -p 8080:8080 -p 50000:50000 ruenzuo/instrumentality-jenkins-performance-sample-config
```

Wait until you see `INFO: Jenkins is fully up and running` before continuing. 

2. Connect your computer to the Jenkins running in Docker as a build node.

```
curl -o "agent.jar" http://localhost:8080/jnlpJars/agent.jar
java -jar "agent.jar" -jnlpUrl http://localhost:8080/computer/macos-host/slave-agent.jnlp -workDir "/tmp/jenkins_macos_host"
```

3. Navigate to [http://localhost:8080](http://localhost:8080) and run/inspect the [sample job](http://localhost:8080/job/instr-ios-sample-app/) prepared for you.

![job_page](https://raw.githubusercontent.com/Ruenzuo/instr-jenkins-docker-image/master/images/job_page.png?token=AAVJ3m8JnUsMGNNT5Lh1r7Ma1u-i1P6Fks5aiYlmwA%3D%3D)
![performance_trend](https://raw.githubusercontent.com/Ruenzuo/instr-jenkins-docker-image/master/images/performance_trend.png?token=AAVJ3t7gJxHmpuVVRUNv5wMlTHc1tdSLks5aiYnPwA%3D%3D)
