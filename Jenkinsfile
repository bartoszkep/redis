pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          docker.build("${IMAGE_NAME}", "-f Dockerfile .")
        }

      }
    }

    stage('Test') {
      steps {
        script {
          docker.image("${IMAGE_NAME}").inside {
            sh './runtest --single unit/type/hash-field-expire'
          }
        }

      }
    }

  }
  environment {
    IMAGE_NAME = 'builddependencies'
  }
  post {
    always {
      cleanWs()
    }

  }
}