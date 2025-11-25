pipeline {
    agent any

    stages {
        stage('Checkout and Install Dependencies') {
            steps {
                // checkout code
                checkout scm
                
                // bat "pip install -r requirements.txt"
                sh """
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements.txt
                """
                // sh "pip install -r requirements.txt"
            }
        }

        stage('Run Unit Tests') {
            steps {
                // bat "pytest -q"
                // sh "export PATH=$PATH:/var/lib/jenkins/.local/bin"
                sh ". venv/bin/activate"
                sh "pytest -q"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                        docker build -t ${DOCKER_IMAGE}:latest .
                    """
                }
            }
        }

        stage('Docker Login & Push') {
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKERHUB_USERNAME',
                        passwordVariable: 'DOCKERHUB_PASSWORD'
                    )]) {
                        sh """
                            echo "Logging into Docker Hub..."
                            echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin

                            echo "Pushing image..."
                            docker push ${DOCKER_IMAGE}:latest

                            echo "Logout..."
                            docker logout
                        """
                    }
                }
            }
        }
    }
}





