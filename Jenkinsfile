node {
	environment {
		registry = "arjunvyadav/myapp"
		registryCredential = 'dockerhub'
		}
        stage('Checkout') {
            git url: 'https://github.com/arjun-venkatesh1/registration-login-java-xml-maven-jsp-mysql.git', branch: 'master'
        }
        def app
        stage('Image') {
                app = docker.build("arjunvyadav/myapp:${env.BUILD_NUMBER}")
       }
       stage('Docker push')
        {
            docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
		app.push()
                app.push('latest')
              }
       }
	stage('Remove Unused docker image') {
		sh "docker system prune --all -f"
	}
}
