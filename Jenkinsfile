pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'docker-credentials' // Replace with your Jenkins credential ID
        DOCKER_REGISTRY = 'docker.io'
    }

    stages {
        stage('Login to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, 
                                                        usernameVariable: 'DOCKER_USER', 
                                                        passwordVariable: 'DOCKER_PASS')]) {
                        bat """
                            echo %DOCKER_PASS% | docker login %DOCKER_REGISTRY% -u %DOCKER_USER% --password-stdin
                        """
                    }
                }
            }
        }
    }
}
