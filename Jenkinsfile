node {
    def app
    def build_tag

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        build_tag = "getintodevops/hellonode:${env.BUILD_NUMBER}"
        app = docker.build(${build_tag})
    }

    

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', '/r/yevtushenko/test/') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
