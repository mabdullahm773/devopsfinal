pipeline {
    agent any  // Runs on any available agent

    environment {
        DOCKER_IMAGE = 'mabdullahm773/devopsfinalimage:latest' // Docker image you specified
        DOCKER_CREDENTIALS = 'docker-credentials' // Replace with the credentials ID for Docker Hub
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_PASSWORD = 'dckr_pat_hQ1_clPF69Qu4hF7ECpq7OpBnlk'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // This step pulls the repository from GitHub
                echo 'Cloning repository...'
                checkout scm  // This clones the repository defined in the job configuration
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image: ${DOCKER_IMAGE}"
                    // Use 'bat' instead of 'sh' for Windows
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-credentials', 
                                                  usernameVariable: 'DOCKER_USER', 
                                                  passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        // Debugging: Print username (password is sensitive and won't be printed)
                        echo "DOCKER_USER: ${DOCKER_USER}"
                        // echo "DOCKER_PASS: ${DOCKER_PASS}"              
        
                        // Log into Docker Hub using credentials
                        echo "Logging into Docker Hub"
                        
                        // Login with password using --password-stdin
                        bat "echo %DOCKER_PASSWORD% | docker login %DOCKER_REGISTRY% -u %DOCKER_USER% --password-stdin"
                        
                        // Push the Docker image
                        echo "Pushing Docker image: ${DOCKER_IMAGE}"
                        bat "docker push %DOCKER_IMAGE%"
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
