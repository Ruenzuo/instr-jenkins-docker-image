#!/usr/bin/env bash

curl -o "agent.jar" http://localhost:8080/jnlpJars/agent.jar
java -jar "agent.jar" -jnlpUrl http://localhost:8080/computer/macos-host/slave-agent.jnlp -workDir "/tmp/jenkins_macos_host"
