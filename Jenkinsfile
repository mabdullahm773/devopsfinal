pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mabdullahm773/devopsfinalimage' // Replace with your Docker Hub repository
        DOCKER_CREDENTIALS = '3862b495-105f-4e4d-953a-9005c01568cf' // Replace with your Jenkins credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scm // Pulls the code from your GitHub repository
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile in the repo
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                    }
                    // Push the Docker image
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
