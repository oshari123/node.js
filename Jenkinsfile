pipeline {
    agent any

    environment {
        REGISTRY = 'trialfwrmrd.jfrog.io'           // 🔁 Replace with your JFrog domain
        IMAGE_NAMESPACE = 'npm-repo-docker'              // 🔁 Replace with your repo name in JFrog
        IMAGE_NAME = 'node-app'                           // 👈 Docker image name
        CREDENTIALS_ID = 'jfrog-creds'                    // 🔁 Jenkins credentials ID for JFrog
    }

    stages {
        stage('Clone, Build, Push') {
            steps {
                checkout scm

                script {
                    def fullImageName = "${REGISTRY}/${IMAGE_NAMESPACE}/${IMAGE_NAME}:latest"
                    echo "Building Docker image: ${fullImageName}"

                    docker.withRegistry("https://${REGISTRY}", CREDENTIALS_ID) {
                        def appImage = docker.build(fullImageName)
                        appImage.push()
                        echo "Successfully pushed ${fullImageName} to JFrog Artifactory"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "✔️ CI/CD Pipeline completed successfully."
        }
        failure {
            echo "❌ Pipeline failed. Please check the logs."
        }
    }
}
