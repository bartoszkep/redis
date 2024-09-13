pipeline {
    agent any

    environment {
        IMAGE_NAME = "builddependencies"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Budujemy obraz Docker
                    docker.build("${IMAGE_NAME}", "-f Dockerfile .")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Uruchomienie testów (opcjonalne, w przypadku dodatkowych testów)
                    docker.image("${IMAGE_NAME}").inside {
                        sh './runtest --single unit/type/hash-field-expire'
                    }
                }
            }
        }
    }

    post {
        always {
            // Czyszczenie środowiska, usuwanie niepotrzebnych plików
            cleanWs()
        }
    }
}
