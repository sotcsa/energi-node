pipeline {
    agent {
        label 'linux'
    }
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        stage('Clone') {
            steps {
                sh 'git clone https://github.com/sotcsa/energi-node.git energi-node'
            }
        }
        stage('Build') {
            steps {
                dir('energi-node') {
                    sh 'make docker/build'
                }
            }
        }
        stage('Security check') {
            steps {
                dir('energi-node') {
                    sh 'make security/check'
                }
            }
        }
        stage('Publish') {
            steps {
                dir('energi-node') {
                    sh 'make docker/publish'
                }
            }
        }
        stage('Deploy') {
            steps {
                dir('energi-node') {
                    sh 'make k8s/redeploy'
                }
            }
        }
    }
    post {
        // Clean after build
        always {
            cleanWs()
        }
    }
}