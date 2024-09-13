pipeline {
    agent any

    environment {
        BUILD_IMAGE = "builddependencies"
        DEPLOY_IMAGE = "deployable"
    }

    stages {
        stage('Build Dependencies') {
            steps {
                script {
                    // Budujemy obraz Docker z Dockerfile dla zależności
                    docker.build("${BUILD_IMAGE}", "-f Dockerfile .")
                }
            }
        }

        stage('Build Deployable Image') {
            steps {
                script {
                    // Budujemy obraz Docker z Dockerfile.deploy
                    docker.build("${DEPLOY_IMAGE}", "-f Dockerfile.deploy .")
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
