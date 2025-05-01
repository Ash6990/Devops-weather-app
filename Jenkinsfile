pipeline {
    agent any

    environment {
        IMAGE_NAME = 'weather-app'
        CONTAINER_NAME = 'weather-app'
        PORT = '5000'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/Ash6990/Devops-weather-app.git'
            }
        }

        stage('Clean Previous Container') {
            steps {
                
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p $PORT:$PORT --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }

    post {
        failure {
            echo '❌ Pipeline failed.'
        }
        success {
            echo '✅ App successfully deployed on port 5000.'
        }
    }
}
