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
          sh 'docker run --rm builddependencies'
        }

      }
    }

    stage('Deploy') {
      steps {
        script {
          sh 'docker build -t deployable -f Dockerfile.deploy .'
        }

      }
    }

    stage('Publish') {
      steps {
        script {
          withDockerRegistry([credentialsId: 'dockerhub-redis', url: '']) {
            sh 'docker tag deployable bartekkep/deployable:latest'
            sh 'docker push bartekkep/deployable:latest'
          }
        }

      }
    }

  }
}