pipeline {
    agent any
    stages {
        //stage("Install dependancies") {
        //    steps {
        //        sh './setup/installPip.sh'
        //    }
        //}
        //stage("Run test") {
        //    steps {
        //        sh 'pipenv run python -m unittest discover -s tests -v'
        //    }
        //}
        stage("StartDocker") {
            steps {
                sh 'service docker start'
            }
        }
        stage("Build Docker image") {
            steps {
                sh 'docker build -t my_image ./app'
            }
        }
        stage("Deploy container") {
            steps {
                sh 'docker run -p 5000:5000 my_image'
                sh ''
            }
        }
    }
}


