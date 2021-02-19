pipeline{
    agent {label 'master'}
    stages{
        stage("github checkout"){
            steps {
                git branch: "master",
                    url: 'https://github.com/tudordabija/test.git'
        
            }
        }
        stage("launch"){
            steps{
                sh "bin/start-all.sh"
            }
        }
        stage("test services"){
            steps{
                sh "bin/check-services.sh"
            }
        }
    }
}