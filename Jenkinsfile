pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mabdullahm773/devopsfinalimage:latest' // Replace with your Docker Hub repository
        DOCKER_CREDENTIALS = 'docker.io' // Replace with your Jenkins credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'devopsfinal', 
                                                  usernameVariable: 'username', 
                                                  passwordVariable: 'password')]) {
                    // Clone the GitHub repository using credentials
                    bat 'git clone https://%username%:%password%@github.com/mabdullahm773/devopsfinal'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dir('devopsfinal') { // Navigate into the cloned repo directory
                    echo "Building Docker image: ${DOCKER_IMAGE}"
                    bat 'docker build -t %DOCKER_IMAGE% .'
                    }
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
