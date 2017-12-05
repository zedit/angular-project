pipeline {
   agent { 
      dockerfile {
         filename "Dockerfile"           
         label "example"
         args "-v /tmp:/tmp"
      }
   }
  
   stages {
      stage('push') {
         steps {
            sh "echo 'Hello!'"                 
         }
      }	
   }
}
