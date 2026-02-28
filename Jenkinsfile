pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "sunandha0218/devops-nginx-node"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:latest .'
            }
        }

      stage('Deploy to Kubernetes') {
    steps {
        sh '''
        export KUBECONFIG=/var/snap/jenkins/4998/.kube/config
        kubectl apply -f deployment.yaml --validate=false
        kubectl apply -f service.yaml --validate=false
        '''
    }
}
    }
}
