pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh "pip install -r requirements.txt"
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh "pytest -q"
            }
        }

        stage('Build Artifact') {
            steps {
                sh "echo Packaging Flask app..."
                sh "tar -czf flask-app.tar.gz app.py requirements.txt"
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploy step can be Docker/Kubernetes/EC2/etc"
            }
        }
    }
}
