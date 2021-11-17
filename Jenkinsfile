pipeline {
    agent any
    stages {
        //stage("Install dependancies") {
        //    steps {
        //        sh './setup/installPip.sh'
        //    }
        //}
        stage("Run test") {
            steps {
                sh 'cd /var/lib/jenkins/workspace/My_Pipeline/app/src'
                sh 'ls'
                sh '/usr/local/bin/pipenv sync'
                sh '/usr/local/bin/pipenv run python -m unittest discover -s tests -v'
            }
        }
        stage("StartDocker") {
            steps {
                sh 'cd /var/lib/jenkins/workspace/My_Pipeline/app'
                sh 'service docker start'
            }
        }
        stage("Build Docker image") {
            steps {
                sh 'docker build -t my_image ./app'
            }
        }
        //stage("Publish image") {
        //    steps {
//
        //    }
        //}
        stage("Deploy container") {
            steps {
                sh 'docker run -p 5000:5000 my_image'
                sh ''
            }
        }
    }
}


