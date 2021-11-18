pipeline {
    environment { 
        my_image = "631692196381.dkr.ecr.eu-west-1.amazonaws.com/my_app_repo" 
        registryCredential = 'aws' 
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
                    script {
                        dockerImage = docker.build my_image
                    }
                }
            }
        }
        stage('Deploy our image') {
            steps {
                script { 
                    docker.withRegistry( 'https://631692196381.dkr.ecr.eu-west-1.amazonaws.com', "ecr:eu-west-1:" + registryCredential ) { 
                        dockerImage.push() 
                    }
                }
            }
        }
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi 631692196381.dkr.ecr.eu-west-1.amazonaws.com/my_app_repo" 
            }
        }
        stage('updating Prod Enviorment') {
            steps {
                dir("setup/terraform_prod") {
                    sh '''
                    terraform init
                    terraform apply -auto-approve
                    '''
                }
            }
        }
    }
}