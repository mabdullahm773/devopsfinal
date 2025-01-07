pipeline {
    agent any
    stages {
        stage('Setup') {
            steps {
                echo 'Setting up environment...'
                // Ensure Python is installed
                sh 'python --version' // Use `bat` on Windows instead of `sh`
            }
        }
        stage('Run Script') {
            steps {
                echo 'Running Hello World script...'
                // Run the Python script
               bat 'C:\\Users\\Mohammad Abdullah\\Desktop\\devopsfinal'
            }
        }
    }
}
