pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sunandha0218/devops-nginx-node"
    }

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/sunandha02/devops-nginx-node.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t :latest .'
            }
        }

        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                usernameVariable: 'USERNAME',
                passwordVariable: 'PASSWORD')]) {
                    sh 'echo  | docker login -u user --password-stdin'
                    sh 'docker push :latest'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
