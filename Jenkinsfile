pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'docker build -t builddependencies .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Uruchom kontener z zaktualizowanym obrazem
                    sh 'docker run --rm builddependencies'
                }
            }
        }
    }
}
