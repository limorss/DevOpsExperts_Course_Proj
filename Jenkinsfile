pipeline {
    agent any
    environment {
        PROJ_NAME = "DevOpsExperts_Course_Proj"
        PROJ_DEV_BRANCH = "development"
        USER = "limorss"
        IMAGE = "${USER}/wog_image"
        CREDS = "630919f2-d46e-494d-8f5e-d2fcd7508c27"
        NODE_NAME = "WOG_Node"
        PORT = "5000"
        FLASK_SERVER_URL = "http://127.0.0.1:${PORT}"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: PROJ_DEV_BRANCH, changelog: false, credentialsId: CREDS, url: "https://github.com/${USER}/${PROJ_NAME}"
            }
        }
        stage('Build docker image (with docker-compose.yaml)') {
            steps {
                bat "docker compose build"
            }
        }
        stage('Run docker (with docker-compose.yaml) - Flask server is up...') {
            steps {
                bat "docker compose up -d"
                // Just for check...
                //bat "docker compose convert"
            }
        }
        stage('Run Tests in container...') {
            steps {
                bat "docker compose exec web python e2e.py -u ${FLASK_SERVER_URL}/"
            }
        }
        stage('Push my docker to docker hub...') {
            steps {
                bat "docker compose push ${IMAGE}"
            }
        }
    }
    post {
        always {
            echo "Always cleanup..."
            bat "docker compose down -v"
        }
    }
}
            