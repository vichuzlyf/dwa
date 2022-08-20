pipeline{
    agent any
   
    environment {
        PATH = "$PATH:/usr/share/maven/bin"
    }
    stages{
        
        
        
        stage('SCM'){
            steps{
                git 'https://github.com/vichuzlyf/dwa.git'

            }
         }        
        
        
        stage('Build'){
            steps{
                sh 'mvn clean package'
            }
         }
        
        
        stage('Image Scan') {
            steps {
                // sh 'mkdir -p reports'
                //sh 'trivy image sonarqube > /home/trivy/Report_PL.txt'
               sh 'trivy image sonarqube'
            }
        }
       
        
        stage('Deploy'){
            steps{
                echo "Deploying .."
                echo "Current Workspace :${env.WORKSPACE}"
                //sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/DWA/target/customwarname.war  Cyberone@54321@52.172.252.88:/usr/local/tomcat/webapps"
                  //sh  "docker cp /var/lib/jenkins/workspace/DWA/target/dwa.war 1bd62bbb7c2e:/usr/local/tomcat/webapps"
            }   
        }
        
        stage('ZAP'){
            steps{
                echo "Scanning ZAP"
               // sshagent(['zap']){
               // sh 'ssh -o StrictHostKeyChecking=no "docker run -t owasp/zap2docker-stable zap-baseline.sh -t http://52.172.252.88:8888/dwa"'
               //sh 'docker run -t owasp/zap2docker-stable zap-baseline.py -t http://52.172.252.88:8888/dwa || true'
              //  sh 'docker run -v /home/zap-report:/zap/wrk/:rw -t owasp/zap2docker-stable zap-full-scan.py -t http://52.172.252.88:8888/dwa -g gen.conf -r testreport.html '
                // }
               // sh './zap.sh'
            }
        }
        stage ('Bin'){
            steps{
                echo "Remove Docker Image"
               //sh 'docker rm $(docker ps -a -f status=exited -q)'
            }
        }
        
        
       
    }
}
