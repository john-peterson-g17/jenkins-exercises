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
                script {
                    echo "node --version"
                    echo "Change to workspace directory..."
                    sh 'pwd'
                    sh 'ls -alh'
                    sh 'cd app'
                    sh 'pwd'
                    sh 'ls -alh'
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