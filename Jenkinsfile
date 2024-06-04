pipeline {
    agent any
    environment {
        CI = 'true'
        registry = "maria0028855/appimg"
        registryCredential = 'Dockerhub'
        dockerImage = ''
    }
    stages {
        stage('install packages') {
            steps {
                sh 'npm install'
            }
        }
        stage('test') {
            steps {
                sh 'nohup npm start &'
                sleep 10
                sh 'curl -k localhost:8000'
            }
        }
        stage('build app') {
            steps {
                sh 'npm run build'
                sh 'tar -czf build.tar.gz ./src ./public package.json'
                archiveArtifacts artifacts: 'build.tar.gz', followSymlinks: false
            }
        }
        // stage('publish docker img')
        stage('build docker image'){
            steps{
                script {
                    dockerImage = docker.build(registry + ":$BUILD_NUMBER")
                }
            }
        }
        stage('scan image'){
            steps{
                sh '''
                    bash scanimg.sh
                    echo $?
                '''
            }
        }
        stage('publish docker image'){
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
        
        stage('deploy image'){
            steps{
                sh 'docker run -d -p 4000:80 --name app maria0028855/appimg'
                sleep 10
                sh 'curl -k localhost:4000'
            }
        }
        stage('cleanup containers'){
            steps{
                sh '''
                    if docker container ls -a | grep app ;
                    then 
                        docker container stop app
                        docker container rm app
                    fi
                '''
            }
        }
    }
}