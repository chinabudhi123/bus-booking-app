pipeline {
    agent any

    environment {
        TARGET_HOST = '3.110.224.229'
        SSH_USER = 'ec2-user'
        SSH_CREDENTIALS_ID = 'ssh-access-key'
        REMOTE_DIR = '/home/ec2-user/bus-booking-app'
    }

    triggers {
        githubPush()
    }

    stages {

        stage('Checkout Source Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/chinabudhi123/bus-booking-app.git'
            }
        }

        stage('Deploy to EC2') {
            steps {
                sshagent(credentials: [env.SSH_CREDENTIALS_ID]) {
                    sh """
                        echo "📁 Creating deployment directory on EC2..."
                        ssh -o StrictHostKeyChecking=no ${SSH_USER}@${TARGET_HOST} 'mkdir -p ${REMOTE_DIR}'

                        echo "📦 Copying application files to EC2..."
                        scp -o StrictHostKeyChecking=no -r * ${SSH_USER}@${TARGET_HOST}:${REMOTE_DIR}

                        echo "🚀 Running setup.sh on EC2..."
                        ssh -o StrictHostKeyChecking=no ${SSH_USER}@${TARGET_HOST} '
                            cd ${REMOTE_DIR} &&
                            chmod +x setup.sh &&
                            ./setup.sh
                        '
                    """
                }
            }
        }
    }

    post {
        success {
            echo '✅ Apache Deployment completed successfully.'
            echo '🌐 Application URL: http://3.110.224.229'
        }
        failure {
            echo '❌ Deployment failed. Please check Jenkins logs.'
        }
    }
}

