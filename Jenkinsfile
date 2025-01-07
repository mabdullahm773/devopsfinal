pipeline {
    agent any
    stages {
        stage('Setup') {
            steps {
                bat 'echo Setting up environment...'
                bat 'cd C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\devopsfinal && your_script.bat'
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
