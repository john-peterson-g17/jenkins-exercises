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
        // stage('Build') {
        //     steps {
        //         script {
        //             echo "Building Docker Image..."
        //             sh 'docker build -t node-app .'
        //         }
        //     }
        // }
    }
}