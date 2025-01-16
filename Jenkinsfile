pipeline {
    agent any  // Runs on any available agent

    environment {
        DOCKER_IMAGE = 'mabdullahm773/devopsfinalimage:latest' // Docker image you specified
        DOCKER_CREDENTIALS = 'docker-credentials' // Replace with the credentials ID for Docker Hub
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_USER = 'mabdullahm773'
        // pas user directly used
        DOCKER_PASS = 'dckr_pat_9O7NMfp8d4KdBuQYxASaryQ-W_Y'
        SLACK_WEBHOOK_URL = 'https://hooks.slack.com/services/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'  // Replace with your actual Slack webhook URL
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
                script {
                    // Log into Docker Hub using credentials
                    echo "Logging into Docker Hub"
                    
                    bat """
                        echo %DOCKER_PASS% | docker login %DOCKER_REGISTRY% -u %DOCKER_USER% --password-stdin
                    """
                    
                    // Push the Docker image
                    echo "Pushing Docker image: ${DOCKER_IMAGE}"
                    
                    bat """
                        docker push %DOCKER_IMAGE%
                    """
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
            script {
                // Send Slack notification for successful pipeline run
                def message = "The Jenkins pipeline has successfully completed!"
                bat """
                    curl -X POST -H 'Content-type: application/json' --data '{"text":"${message}"}' ${SLACK_WEBHOOK_URL}
                """
            }
        }
        failure {
            echo 'Pipeline failed.'
            script {
                // Send Slack notification for failed pipeline run
                def message = "The Jenkins pipeline has failed."
                bat """
                    curl -X POST -H 'Content-type: application/json' --data '{"text":"${message}"}' ${SLACK_WEBHOOK_URL}
                """
            }
        }
    }
}
