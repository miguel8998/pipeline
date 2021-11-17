pipeline {
    environment { 
        registry = "miguellopez98/test_app_image" 
        registryCredential = 'docker_id' 
        dockerImage = '' 
    }
    agent any
    stages {
        //stage("Install dependancies") {
        //    steps {
        //        sh './setup/installPip.sh'
        //    }
        //}
        stage("Run test") {
            steps {
                sh '''
                    cd /var/lib/jenkins/workspace/My_Pipeline/app/src 
                    /usr/local/bin/pipenv sync
                    /usr/local/bin/pipenv run python -m unittest discover -s tests -v
                '''
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
        stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        }
    }
}


