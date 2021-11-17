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
                sh 'service docker start'
            }
        }
        stage("Build Docker image") {
            steps {
                dir("app") {
                    sh 'docker build -t miguellopez98/my_app .'
                }
            }
        }
        stage('Deploy our image') {
            steps {
                sh 'docker push miguellopez98/my_app'
                //script { 
                //    docker.withRegistry( '', registryCredential ) { 
                //        my_image.push() 
                //    }
                //}
            }
        }
        //stage('Cleaning up') { 
        //    steps { 
       //         sh "docker rmi my_app" 
       //     }
        //}
    }
}