pipeline {
    agent any

    environment {
        DOCKER_USER = 'mabdullahm773'
        DOCKER_PASS = 'your-docker-token'  // Avoid hardcoding, use credentials in Jenkins
    }

    stages {
        stage('Login to Docker Hub') {
            steps {
                script {
                    bat """
                        echo %DOCKER_PASS% | docker login docker.io -u %DOCKER_USER% --password-stdin
                    """
                }
            }
        }
    }
}
