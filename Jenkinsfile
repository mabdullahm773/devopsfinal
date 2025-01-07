pipeline {
    agent {
        docker {
            image 'python:3.10' // Use a Python Docker image
        }
    }
    stages {
        stage('Clone Repository') {
            steps {
                checkout scm // This checks out the code from your GitHub repository
            }
        }
        stage('Run Python Script') {
            steps {
                sh 'python file.py' // Executes your Python script
            }
        }
    }
}
