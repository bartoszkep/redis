pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t builddependencies .'
            }
        }

        stage('Test') {
            steps {
                script {
                    // Uruchomienie kontenera, który uruchamia Redis i testy
                    sh '''
                    docker run --rm builddependencies
                    '''
                }
            }
        }
    }
}
