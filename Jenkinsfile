pipeline {
    agent any
    tools {
        nodejs 'node-21'
    }
    stages {
        stage('Increment Version') {
            steps {
                dir('app') {
                    script {
                        env.VERSION = """${sh(script: 'npm version patch', returnStdout: true).trim()}"""
                        echo "Version: ${env.VERSION}"
                    }
                }
            }
        }
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
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        echo "Building Docker Image..."
                        sh 'docker build -t johnpdevops/node-app:$VERSION .'
                        echo "Logging in to DockerHub..."
                        sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                        echo "Pushing Docker Image..."
                        sh 'docker push johnpdevops/node-app:$VERSION'
                    }
                }
            }
        }
        stage('Commit Version to Repository') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GITHUB_PASSWORD', usernameVariable: 'GITHUB_USERNAME')]) {
                        echo "Commiting new version to git repository..."

                        sh 'git config user.email "jenkins@example.com"'
                        sh 'git config user.name "Jenkins"'

                        sh 'git remote set-url origin https://${GITHUB_USERNAME}:${GITHUB_PASSWORD}github.com/john-peterson-g17/jenkins-exercises'
                        sh 'git add .'
                        sh 'git commit -m "Incremented version to $VERSION"'

                        echo "Pushing new version to git repository..."
                        sh 'git push origin main'
                    }
                }
            }
        }
    }
}