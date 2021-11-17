pipeline {
    environment { 
        registry = "miguellopez98/test_app_image" 
        registryCredential = 'docker_id' 
        dockerImage = '' 
    }
    agent any
    stages {
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
                script {
                    cd app
                    dockerImage = docker.build my_image
                }
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
        //stage('Cleaning up') { 
        //    steps { 
       //         sh "docker rmi my_app" 
       //     }
        //}
    }
}