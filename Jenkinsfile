pipeline {
    agent any // windows agent, Jenkins-Laravel (other machine)
    environment {
        BOT_TOKEN = '6539250164:AAHI-HPRpX2dhlhRqa3sdyXK57bwL5Ayhfg'
        CHAT_ID = '906725789'
        EMAIL_RECIPIENT = 'vatsenghong@gmail.com'
    }


    stages {
        stage('Fetch from GitHub') { // build steps
            steps {
                echo 'Fetching from GitHub'
                git branch: 'tp03', url:'https://github.com/SenghongVat/jenkin-laravel.git'
            }
        }
        stage('Build using Tools') {
            steps {
                echo 'Compiling code...'
                sh 'cp .env.example .env'
                sh 'composer install && php artisan key:generate && npm install && npm run build'
            }
        }
        stage('Test the app') {
            steps {
                echo 'Testing unit tests...'
                echo 'Testing features...'
                sh 'php artisan test'
            }
        }
    }
    // post {
    //     failure {
    //         // Send email notification
    //         mail to: 'vatsenghong@gmail.com',
    //              subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
    //              body: "Something is wrong with the build: ${env.BUILD_URL}"

    //         // Send Telegram notification
    //         script {
    //             sh "curl -X POST https://api.telegram.org/bot6539250164:AAHI-HPRpX2dhlhRqa3sdyXK57bwL5Ayhfg/sendMessage -d chat_id=906725789 -d text='Pipeline failed: ${env.JOB_NAME} #${env.BUILD_NUMBER}'"
    //         }
    //     }
    // }
}
