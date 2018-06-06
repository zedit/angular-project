import java.text.SimpleDateFormat

properties([
  parameters([
    string(name: 'gitRepo', defaultValue: 'https://github.com/zedit/angular-project'),
    string(name: 'realCommitSha', defaultValue: ''),
    string(name: 'registryURL', defaultValue: ''),
    string(name: 'registryName', defaultValue: ''),
    string(name: 'imageName', defaultValue: 'test'),
    string(name: 'gitCredentials', defaultValue: ''),
  ])
])


node ('jenkins slave') {
    stage('Checkout') {
        checkout ( [$class: 'GitSCM',
            branches: [[name: commit ]],
            userRemoteConfigs: [[
                credentialsId: params.gitCredentials, 
                url: params.gitRepo]]])
    } 

    def shortSha = commit.take(8)
    stage('Test_build image') {
        try {
            sh "cp Dockerfile Dockerfile.test"
            sh "sed -i \"s#npm install -g --unsafe-perm @angular/cli#npm test#\" Dockerfile.test"
            sh "docker build -f Dockerfile.test -t name:test ."
            sh "docker rmi -f name:test"
            sh "rm Dockerfile.test"
        }

        catch (err) {
            println "an error has occurred"
            def images = sh(returnStdout: true, script: '/usr/bin/docker images | grep "^<none>" | awk \'{print $3}\'')
            sh("/usr/bin/docker rmi -f $images")
            throw err;
        }

    }

}
