pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub')
        IMAGE_NAME = 'evgeniyabal/custom-nginx'
    }

    triggers {
        pollSCM('* * * * *') // Проверка каждую минуту (или webhook)
    }

    stages {
        stage('Clone repository') {
            steps {
                git credentialsId: 'github-token', url: 'https://github.com/EvgeniyaBalanyuk/', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME:latest ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    sh "docker push $IMAGE_NAME:latest"
                }
            }
        }
    }
}
