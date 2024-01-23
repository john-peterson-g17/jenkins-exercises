pipeline {
    agent any
    tools {
        nodejs 'node-21'
    }
    // environment { 
    //     VERSION = """${sh(
    //             returnStdout: true,
    //             script: 'echo cat package.json | jq -r ".version"'
    //         )}"""
    // }
    // // Test Push
    stages {
        stage('Test') {
            steps {
                dir('app') {
                    sh "node --version"
                    echo "Installing npm packages..."
                    sh 'npm install'
                    echo "Running tests..."
                    sh 'npm run test'
                }
            }
        }
        stage('Build') {
            environment {
                DOCKERHUB_CREDS = credentials('dockerhub')
                // TODO: Build image and push to dockerhub
                // TODO: Tag image with version
                // TODO: Increment version in package.json and commit to git
                // TODO: Access dockerhub creds with $DOCKERHUB_CREDS_USR and $DOCKERHUB_CREDS_PSW
            }
            steps {
                script {
                    echo "Building Docker Image..."
                    sh 'docker build -t node-app .'
                }
            }
        }
    }
}