pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'your-dockerhub-username/hello-world-image:latest' // Update with your Docker Hub repo
        DOCKER_CREDENTIALS = 'docker-credentials' // Replace with the credentials ID you created for Docker Hub
    }

    stages {
        stage('Clone Repository') {
            steps {
                script {
                    echo "Cloning public GitHub repository..."
                    sh 'git pull' // GitHub repo is already cloned
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ${DOCKER_IMAGE}"
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        echo "Logging into Docker Hub"
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        echo "Pushing Docker image: ${DOCKER_IMAGE}"
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished!'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
