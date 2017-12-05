pipeline {
   agent {
      dockerfile true
   }
   agent { 
      dockerfile {
         filename "Dockerfile"           
         label "example"
      }
   }
  
   stages {
         stage('Test') {
            steps {
               sh "echo 'Hello!'"
                 
            }
         }	
    }
}
